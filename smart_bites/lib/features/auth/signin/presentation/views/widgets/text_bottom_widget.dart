import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class TextBottomWidget extends StatelessWidget {
  final String textStatic;
  final String textBottom;
  final String? routeName;
  final bool? isPop;
  const TextBottomWidget({
    super.key,
    required this.textStatic,
    required this.textBottom,
    this.routeName,
    this.isPop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textStatic, style: AppTextStyles.medium14),
        TextButton(
          onPressed: () {
            if (isPop!) {
              Navigator.pop(context);
            } else if (routeName != null) {
              Navigator.pushNamed(
                context,
                routeName!
              );
            }
          },
          child: Text(
            textBottom,
            style: AppTextStyles.bold20.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
