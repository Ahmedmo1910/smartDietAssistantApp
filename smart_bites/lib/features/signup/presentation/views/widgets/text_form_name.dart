import 'package:flutter/material.dart';

class TextFormName extends StatefulWidget {
  const TextFormName({
    super.key,
    required this.nameController,
    required this.textName,
    required this.prefixIcon,
  });

  final TextEditingController nameController;
  final String textName;
  final Icon prefixIcon;

  @override
  State<TextFormName> createState() => _TextFormNameState();
}

class _TextFormNameState extends State<TextFormName> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.nameController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }
        return null;
      },

      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,

        labelText: widget.textName,
        hintStyle: const TextStyle(fontSize: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
