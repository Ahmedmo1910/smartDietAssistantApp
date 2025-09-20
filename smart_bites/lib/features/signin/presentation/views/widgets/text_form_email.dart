import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/validation/validation_email.dart';

class TextFormEmail extends StatelessWidget {
  TextFormEmail({
    super.key,
    required this.textEmail,
    required this.prefixIcon,
    this.checkEmailValidation = AutovalidateMode.onUserInteraction,
  });
  AutovalidateMode checkEmailValidation;
  final String textEmail;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: checkEmailValidation,
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
