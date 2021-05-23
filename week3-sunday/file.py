from rich.console import Console  # non-standard

from json import dump  # standard

console = Console()
print = console.print

with open("trstopwords.txt") as fp, open("trstopwords.json", "w") as wp:
    stopword = {line.strip(): i for i, line in enumerate(fp)}
    dump(stopword, wp)

# 8 lines
# two_times = dict((k, 2 * v) for k, v in list_of_values.items())
