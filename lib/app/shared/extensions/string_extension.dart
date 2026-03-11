extension StringValidationExtension on String {
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w\.\-]+@[\w\-]+\.\w{2,}$');
    return emailRegex.hasMatch(trim());
  }

  bool get isNotBlank => trim().isNotEmpty;
}
