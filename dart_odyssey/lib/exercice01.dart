void main() {
  print("--- Exercice 01 ---");

  const String apollo13Message = "Houston, we have a problem";
  print(apollo13Message);
  print("$apollo13Message (Jim Lovell, Apollo 13)");

  const String inter = "inter";
  const String stellar = "stellar";
  print("$inter${stellar.toUpperCase()}");

  String? accessCode;
  String result = (accessCode == null || accessCode.isEmpty)
                  ? "Wrong access code"
                  : "Welcome";
  print(result);

  accessCode = "1234";
  print((accessCode == null || accessCode.isEmpty) ? "Wrong access code" : "Welcome");

  const hal9000Message = "I'm sorry Dave, I'm afraid I can't do that.";
  final List<String> words = List.unmodifiable(
    hal9000Message.replaceAll(RegExp(r"[',.]"), "").split(" ")
  );
  print(words);

  const warningMessage = "Failure is not an option";
  String optionWord = warningMessage.split(" ").last;
  String reversed = optionWord.split('').reversed.join('').toUpperCase();
  print(reversed);

  const warningMessage1337 = "F411Ur3 15 N07 4N OP710N";
  print(warningMessage1337);

  const String email = "rick.deckard@tyrell-corporation.net";
  bool isValid = email.contains('@') && email.split('@').last.contains('.');
  print(isValid ? "Email valide" : "Email invalide");
}