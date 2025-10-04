import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class VerifyButton extends StatelessWidget {
  final bool isEmailVerified;
  final Future<void> Function() onPressed;

  const VerifyButton({
    super.key,
    required this.isEmailVerified,
    required this.onPressed,
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

        onPressed: () async {
          await onPressed();
          if (!isEmailVerified) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Your Email is not verified yet')),
            );
          }
        },
        child: Text(
          'I’ve verified my Email',
          style: AppTextStyles.semiBold18.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
