import csv
import io

import requests  # non standard

from rich.console import Console  # non-standard

console = Console()
print = console.print

result = requests.get(
    "https://data.ibb.gov.tr/dataset/19c14482-14f2-4803-b4df-4cf4c6c42016/resource/b68cbdb0-9bf5-474c-91c4-9256c07c4bdf/download/dam_occupancy.csv")

print(result.headers)

file_like = io.StringIO(result.text)
dialect = csv.Sniffer().sniff(file_like.read(1024))

print(dialect.delimiter)

file_like.seek(0)

damcsv = csv.DictReader(file_like, dialect=dialect)

for line in damcsv:
    print(line["DATE"])
    print(float(line["GENERAL_DAM_OCCUPANCY_RATE"]))
