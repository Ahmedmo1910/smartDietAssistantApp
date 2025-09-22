import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class ElevatedBottomWidget extends StatelessWidget {
  final String textBottom;
  final GlobalKey<FormState>? formKey;
  final bool showDialogOnSuccess;
  final String? routeName;
  final VoidCallback? onSuccess;

  const ElevatedBottomWidget({
    super.key,
    required this.textBottom,
    this.formKey,
    this.routeName,
    this.showDialogOnSuccess = true,
    this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
        onPressed: () {
          if (formKey == null || formKey!.currentState!.validate()) {
            formKey?.currentState!.save();
            formKey?.currentState!.reset();
            onSuccess?.call();
            if (routeName != null) {
              Navigator.pushReplacementNamed(context, routeName!);
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            textBottom,
            style: AppTextStyles.semiBold25.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
