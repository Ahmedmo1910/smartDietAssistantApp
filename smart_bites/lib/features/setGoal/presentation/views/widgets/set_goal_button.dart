import 'package:flutter/material.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_button.dart';

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
    return MainButton(
      width: 140,
      height: 50,
      hasCircularBorder: true,
      text: 'Set your goal',
      onTap: () {
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
    );
  }
}
