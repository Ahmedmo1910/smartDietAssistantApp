import 'package:flutter/material.dart';
import 'package:smart_bites/features/validation/validation_email.dart';

class TextFormEmail extends StatefulWidget {
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
  State<TextFormEmail> createState() => _TextFormEmailState();
}

class _TextFormEmailState extends State<TextFormEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.emailController,

      validator: validationEmail(),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        // const Icon(Icons.lock),
        labelText: widget.textEmail,
        hintStyle: const TextStyle(fontSize: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
