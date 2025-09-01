String? Function(String?) validationEmail() {
  return (String? email) {
    final trimmedEmail = email?.trim();

    if (trimmedEmail == null || trimmedEmail.isEmpty) {
      return 'Email is required';
    } else if (!trimmedEmail.contains('@') || !trimmedEmail.contains('.')) {
      return 'Invalid email format';
    } else {
      return null;
    }
  };
}
