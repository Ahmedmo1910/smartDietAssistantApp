import 'package:flutter/material.dart';
import 'package:smart_bites/features/validation/validation_password.dart';

class TextFormPassword extends StatefulWidget {
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
  State<TextFormPassword> createState() => _TextFormPasswordState();
}

class _TextFormPasswordState extends State<TextFormPassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: !widget.hiddenPassword,
      validator: widget.validator ?? validationPasswordMethod(),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: widget.onToggle,
          icon: Icon(
            widget.hiddenPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        prefixIcon: const Icon(Icons.lock),
        labelText: widget.textPassword,

        hintStyle: const TextStyle(fontSize: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
