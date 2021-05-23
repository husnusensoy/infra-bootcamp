# Create some file into a directory

from pathlib import Path

try:
    from rich.console import Console  # non-standard

    console = Console()
    log = console.log
except ImportError:
    try:
        from loguru import logger

        log = logger.info
    except ImportError:
        log = print

subdirs = ["raw", "processed", "vocabulary"]

for subdir in subdirs:
    d = (Path("data") / subdir)
    d.mkdir(parents=True, exist_ok=True)

    log(f"Creatint directory {d}")

for file_id in range(100):
    palindrom = "The quick brown fox jumps over the lazy dog ."

    with (Path("data") / "raw" / f"{file_id}.txt").open("w") as wp:
        for _ in range(file_id * 10):
            print(palindrom, file=wp)

