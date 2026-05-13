final List<String> planets = [
  "Earth",
  "Mars",
  "Mercury",
  "Saturn",
  "Venus",
  "Neptune",
  "Uranus",
  "Jupiter",
];

void main() {
  print("Planètes avant tri : $planets");
  planets.sort();
  print("Planètes après tri : $planets");
  planets.reversed.toList();
  print("Planètes après inversion : ${planets.reversed.toList()}");

  String numberToWord(int number) {
    const List<String> words = [
      "one", "two", "three", "four", "five", "six", "seven",
    ];
    if (number >= 4 && number <= 7) {
      return words[number - 1];
    } else {
      return "Number out of range";
    }
  }

  print("Le nombre 5 en lettres est : ${numberToWord(5)}");

  var planetsCharsLength = planets.map((name) {
    int length = name.length;
  
    return numberToWord(length);
  }).toList();

  print(planetsCharsLength);

  for (var planet in planets) {
    int length = planet.length;

    if (length % 2 == 0) {
      print("$planet : even");
    } else {
      print("$planet : odd");
    }
  }
}