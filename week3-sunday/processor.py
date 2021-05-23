#!/Users/husnusensoy/miniconda3/bin/python
from pathlib import Path
import gzip
from json import dump as jdump, load as jload
from collections import Counter

from rich.console import Console  # non-standard

import click  # non-standard

console = Console()
print = console.print


@click.group()
def cli():
    pass


@cli.command()
@click.argument("file_id")
@click.option("--force/-f", help="Force target file creation", default=False)
def tokenize(file_id, force):
    """Split raw documents into tokens and store them in
        gzip json files with corresponding file names.
    """
    source_path = Path("data") / "raw" / f"{file_id}.txt"
    target_path = Path("data") / "processed" / f"{file_id}.json.gz"

    if (not target_path.exists()) or force:
        with open(source_path) as fp:
            d = {line_id: [word.lower() for word in line.strip().split()] for line_id, line in enumerate(fp)}

        with gzip.open(target_path, "wt", encoding="ascii") as wp:
            jdump(d, wp)
    else:
        print(f"{target_path} is already there.")


@cli.command()
@click.argument("file_ids", nargs=-1)
def vocaber(file_ids):
    cou = Counter()
    for file_id in file_ids:
        with gzip.open(Path("data") / "processed" / f"{file_id}.json.gz") as fp:
            j = jload(fp)
            cou += Counter([e for l in j.values() for e in l])

    with open("data/vocabulary/vocab.json", "w") as wp:
        jdump(cou, wp)


if __name__ == '__main__':
    cli()
