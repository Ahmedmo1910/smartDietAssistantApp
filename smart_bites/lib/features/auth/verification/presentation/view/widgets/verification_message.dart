import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class VerificationMessage extends StatelessWidget {
  const VerificationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Email Verification',
          style: AppTextStyles.semiBold18,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          'Please verify your email to activate your account.',
          style: AppTextStyles.regular18.copyWith(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
