const int earthOrbitDays = 365;
const double marsOrbitDays = 686.97;
const double saturnOrbitDays = 10759.22;
const double earthSunDistanceMkm = 149.597;
const double marsSunDistanceMkm = 227.936;
const String rawLightSpeed = "299792";


void main() {

  var totalOrbitDays = earthOrbitDays + marsOrbitDays;
  print ("Le nombre total de jours pour faire une orbite complète autour du soleil pour la Terre et Mars est de : $totalOrbitDays jours.");

  print (earthSunDistanceMkm.ceil());
  print (earthSunDistanceMkm.floor());
  print (earthSunDistanceMkm.round());
  print (earthSunDistanceMkm.truncate());

  double saturnOrbitYears = saturnOrbitDays / earthOrbitDays;
  print ("Le nombre d'années que Saturne met pour faire une orbite complète autour du soleil est de : ${saturnOrbitYears.toStringAsFixed(2)} années.");
  print (saturnOrbitYears.toInt());
  print (saturnOrbitYears.round());

  int lightSpeed = int.parse(rawLightSpeed);
  print ("La vitesse de la lumière est de : $lightSpeed km/s.");

  double earthMarsDistanceMkm = marsSunDistanceMkm - earthSunDistanceMkm;
  print ("La distance entre la Terre et Mars est de : ${earthMarsDistanceMkm.toStringAsFixed(2)} millions de kilomètres.");

  double lightTimeSeconds = (earthMarsDistanceMkm * 1e6) / (lightSpeed * 1000);
  print ("Le temps que la lumière met pour voyager de la Terre à Mars est de : ${lightTimeSeconds.toStringAsFixed(2)} secondes.");

  double lightTimeMinutes = lightTimeSeconds / 60;
  print ("Le temps que la lumière met pour voyager de la Terre à Mars est de : ${lightTimeMinutes.toStringAsFixed(2)} minutes.");

  String corruptedSignal = "54.6abc";
  double? result = double.tryParse(corruptedSignal); 

  if (result == null) {
    print("La conversion a échoué pour la chaîne de caractères : '$corruptedSignal'.");
  } else {
    print("Le résultat de la conversion est : $result.");
  }
}