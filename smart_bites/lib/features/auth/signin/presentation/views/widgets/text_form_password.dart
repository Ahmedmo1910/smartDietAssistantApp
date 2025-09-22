import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/validation/validation_password.dart';

class TextFormPassword extends StatelessWidget {
  const TextFormPassword({
    super.key,
    required this.passwordController,
    required this.hiddenPassword,
    required this.onToggle,
    required this.textPassword,
    this.validator,
  });

  final TextEditingController passwordController;
  final bool hiddenPassword;
  final VoidCallback onToggle;
  final String textPassword;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: passwordController,
      obscureText: !hiddenPassword,
      validator: validator ?? validationPasswordMethod(),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onToggle,
          icon: Icon(
            hiddenPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        prefixIcon: const Icon(Icons.lock),
        labelText: textPassword,
        hintStyle: AppTextStyles.regular20,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
