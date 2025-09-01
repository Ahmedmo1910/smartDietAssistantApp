
String? Function(String?)? validationPasswordMethod(){
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Less length';
    }

    return null;
  };
}
