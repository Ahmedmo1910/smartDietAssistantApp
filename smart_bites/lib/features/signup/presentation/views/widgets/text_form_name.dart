import 'package:flutter/material.dart';

class TextFormName extends StatelessWidget {
  const TextFormName({
    super.key,
    required this.textName,
    required this.prefixIcon,
    this.checkNameVlidation = AutovalidateMode.onUserInteraction,
  });
  final AutovalidateMode checkNameVlidation;

  final String textName;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: checkNameVlidation,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }
        return null;
      },

      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: textName,
        hintStyle: const TextStyle(fontSize: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
