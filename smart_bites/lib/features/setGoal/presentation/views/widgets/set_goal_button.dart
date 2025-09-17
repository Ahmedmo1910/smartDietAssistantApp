import 'package:flutter/material.dart';

import 'alert.dart';

class SetGoalButton extends StatelessWidget {
  const SetGoalButton({
    super.key,
    required this.formState,
    required this.controller,
    required this.onSave,
  });
  final GlobalKey<FormState> formState;
  final TextEditingController controller;
  final Function(String) onSave;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              formKey: formState,
              controller: controller,
              onSave: (value) {
                onSave(value);
              },
            );
          },
        );
      },

      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text('Set Your Goal', style: TextStyle(fontSize: 15)),
    );
  }
}
