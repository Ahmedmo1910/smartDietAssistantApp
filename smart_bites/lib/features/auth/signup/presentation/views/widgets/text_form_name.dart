import 'package:flutter/material.dart';

class TextFormName extends StatelessWidget {
  const TextFormName({
    super.key,


    required this.textName,
    required this.prefixIcon,
    this.onSaved,

  });
  

  final String textName;
  final Icon prefixIcon;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
      onSaved: onSaved,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: textName,
        hintStyle: const TextStyle(fontSize: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
