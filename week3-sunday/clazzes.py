from rich.console import Console  # non-standard

console = Console()
print = console.print


class Human:
    def __init__(self, name, age=30):
        self.name = name
        self.age = age

    def __str__(self):
        return f"{self.name} (age: {self.age})"

    def __eq__(self, other):
        if isinstance(other, Human):
            return self.name.lower() == other.name.lower()
        elif isinstance(other, str):
            return self.name.lower() == other.lower()
        else:
            raise TypeError(f"Human or str is expected. ({type(other)} found)")


husnu = Human("Husnu Sensoy", 38)
husnu2 = Human("Husnu SENSOY", 38)

print(husnu)

print(husnu == "Husnu Sensoy")

try:
    print(husnu == 38)
except:
    print("Something happened...")

