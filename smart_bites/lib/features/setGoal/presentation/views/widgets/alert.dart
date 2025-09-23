import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_button.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_text_field.dart';

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
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 300,
        width: 300,
        child: Form(
          key: widget.formKey,
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Icon(
                Icons.fastfood,
                size: 70,
                color: AppColors.primaryColor,
              ),
              const SizedBox(height: 15),
              Text(
                'Set Your Daily Calories',
                style: AppTextStyles.bold20.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                
                controller: widget.controller,
                hintText: "Calories",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              MainButton(
                height: 50,
                width: 120,
                text: 'Save',
                hasCircularBorder: true,
                onTap: () {
                  if (widget.formKey.currentState!.validate()) {
                    widget.formKey.currentState!.save();
                    widget.onSave(userInput);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please Enter your daily calories.😊',
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
