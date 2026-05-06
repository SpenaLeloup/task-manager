import 'package:dart_odyssey/classes/journey.dart';

void main() {
  print("--- Exercice 06 : POO ---");

  const double earthMoonDistanceKm = 384400;

  final apollo11Journey = Journey(
    origin: "Earth",
    destination: "Moon",
    distanceKm: earthMoonDistanceKm,
    vehicleName: "Apollo 11",
    speedKmH: 3683,
  );

  final starshipJourney = apollo11Journey.copyWith(
    vehicleName: "Starship",
    speedKmH: 27000,
  );

  final saturnVJourney = apollo11Journey.copyWith(
    vehicleName: "Saturn V",
    speedKmH: 40000,
  );

  final newHorizonsJourney = apollo11Journey.copyWith(
    vehicleName: "New Horizons",
    speedKmH: 58536,
  );

  print("Voyage de base : $apollo11Journey");
  print("Durée avec Starship : ${starshipJourney.durationHours.toStringAsFixed(2)} h");
  print("Durée avec Saturn V : ${saturnVJourney.durationHours.toStringAsFixed(2)} h");
  print("Durée avec New Horizons : ${newHorizonsJourney.durationHours.toStringAsFixed(2)} h");
}