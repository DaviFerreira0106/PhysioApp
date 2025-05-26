class Patient {
  final String id;
  final String name;
  final String email;
  final String cpf;
  final String password;

  const Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.cpf,
    required this.password,
  });

  String get semiAnonimiCpf {
    final String initialCpf = cpf.substring(0, 3);
    final String finalCpf = cpf.substring(9, 10);
    final String anonCpf = '${initialCpf}******$finalCpf';
    return anonCpf;
  }

  String get semiAnonimiEmail {
    final List<String> partsEmail = email.split('@');
    final String firstPart = partsEmail[0];
    final String finallyPart = partsEmail[1];
    final String anonFirstPart = firstPart.substring(0, 2).padRight(6, '*');
    final String emailSemiAnon = '${anonFirstPart}@${finallyPart}';
    return emailSemiAnon;
  }
}
