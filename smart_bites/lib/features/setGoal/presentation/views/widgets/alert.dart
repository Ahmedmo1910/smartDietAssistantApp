import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final Function(String) onSave;

  const CustomAlertDialog({
    super.key,
    required this.formKey,
    required this.controller,
    required this.onSave,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  late String userInput;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 300,
        width: 300,
        child: Form(
          key: widget.formKey,
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Icon(Icons.fastfood, size: 70, color: Colors.green),
              const SizedBox(height: 15),
              const Text(
                'Set Your Day Calories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Value ";
                  }
                  final number = double.tryParse(value);
                  if (number == null || number < 0) {
                    return "Please enter a valid number";
                  }
                  if (number < 200) {
                    return "Value must be bigger than 200";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  userInput = value!;
                },
                controller: widget.controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {
                    widget.formKey.currentState!.save();
                    widget.onSave(userInput);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please fix the error and Enter a valid number',
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
