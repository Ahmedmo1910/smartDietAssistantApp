
import 'package:flutter/material.dart';

String? Function(String?)? validationPasswordMethod(){
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


// Validation for confirm password
String? Function(String?)? validationConfirmPasswordMethod(
  TextEditingController passwordController,
) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }

    if (value.length < 6) {
      return 'Confirm password too short';
    }

    if (value != passwordController.text) {
      return "Password doesn't match";
    }

    return null;
  };
}
