import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class MainButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final bool hasCircularBorder;
  final Widget? child;
  final double width;
  final double height;

  MainButton({
    super.key,
    this.text,
    this.onTap,
    this.hasCircularBorder = false,
    this.child,
    this.width = double.infinity,
    this.height = 56.0,
  }) {
    assert(text != null || child != null);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: hasCircularBorder
              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
              : null,
        ),
        child: text != null
            ? Text(
                text!,
                style: AppTextStyles.medium18.copyWith(color: Colors.white),
              )
            : child,
      ),
    );
  }
}
