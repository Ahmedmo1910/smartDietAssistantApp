import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/validation/validation_email.dart';

class TextFormEmail extends StatelessWidget {
  const TextFormEmail({
    super.key,
    required this.emailController,
    required this.textEmail,
    required this.prefixIcon,
  });

  final TextEditingController emailController;
  final String textEmail;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,

      validator: validationEmail(),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: textEmail,
        hintStyle: AppTextStyles.regular20,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
