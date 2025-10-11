class MetroLine {
  final String name;
  final String whatsappNumber;
  final String route;
  final String line;

  const MetroLine({
    required this.name,
    required this.whatsappNumber,
    required this.route,
    required this.line,
  });
}

class City {
  final String name;
  final List<MetroLine> metroLines;

  const City({
    required this.name,
    required this.metroLines,
  });
}

const List<City> cities = [
  City(
    name: 'Mumbai',
    metroLines: [
      MetroLine(name: 'Mumbai Metro One', whatsappNumber: '+919670008889', route: 'Versova to Ghatkopar', line: 'Blue Line'),
      MetroLine(name: 'Maha Mumbai Metro (Lines 2A, 7)', whatsappNumber: '+918652635500', route: "", line: 'Yellow, Red Lines'),
      MetroLine(name: 'Mumbai Metro Line 3', whatsappNumber: '+919873016836', route: 'Colaba-Bandra-SEEPZ', line: "Aqua Line"),
    ],
  ),
  City(
    name: 'Pune',
    metroLines: [
      MetroLine(name: "Pune Metro", whatsappNumber: '+919420101990', route: "", line: "Purple, Aqua Lines")
    ]
  )
];