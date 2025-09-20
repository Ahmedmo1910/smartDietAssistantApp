import 'package:flutter/material.dart';

String? Function(String?)? validationPasswordMethod() {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password too short';
    }

    return null;
  };
}

String? Function(String?) validationConfirmPasswordMethod(String? password) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value.length < 6) {
      return 'Confirm password too short';
    }
    if (value != password) {
      return "Passwords don't match";
    }
    return null;
  };
}
