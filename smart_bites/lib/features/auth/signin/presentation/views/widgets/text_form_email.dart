import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/validation/validation_email.dart';

class TextFormEmail extends StatelessWidget {
  const TextFormEmail({
    super.key,

    required this.textEmail,
    required this.prefixIcon,
    this.onSaved,
  });

  final String textEmail;
  final Icon prefixIcon;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
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
