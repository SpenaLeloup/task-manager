class Journey {
  final String origin;
  final String destination;
  final double distanceKm;
  final String vehicleName;
  final double speedKmH;

  Journey({
    required this.origin,
    required this.destination,
    required this.distanceKm,
    required this.vehicleName,
    required this.speedKmH,
  });

  double get durationHours => distanceKm / speedKmH;

  @override
  String toString() {
    return "Journey($origin -> $destination | $vehicleName | $speedKmH km/h | ${durationHours.toStringAsFixed(2)}h)";
  }

  Journey copyWith({
    String? vehicleName,
    double? speedKmH,
  }) {
    return Journey(
      origin: this.origin,
      destination: this.destination,
      distanceKm: this.distanceKm,
      vehicleName: vehicleName ?? this.vehicleName,
      speedKmH: speedKmH ?? this.speedKmH,
    );
  }
}