import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
    required this.headerTitle,
    required this.headerSubTitle,
  });
  final String headerTitle;
  final String headerSubTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerTitle, style: AppTextStyles.bold25),
          SizedBox(height: 10),
        Text(headerSubTitle, style: AppTextStyles.regular18),
        SizedBox(height: 30),
      ],
    );
  }
}
