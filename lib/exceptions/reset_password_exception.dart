class ResetPasswordExceptions implements Exception {
  static const Map<String, String> _errors = {
    'INVALID_EMAIL': 'Endereço de e-mail não encontrado.',
  };
  final String error;

  const ResetPasswordExceptions({required this.error});

  @override
  String toString() {
    // TODO: implement toString
    return _errors[error] ?? 'Ocorreu um erro na autenticação';
  }
}
