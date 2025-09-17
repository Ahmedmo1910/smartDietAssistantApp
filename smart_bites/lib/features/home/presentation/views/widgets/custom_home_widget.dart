import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class CustomHomeWidget extends StatelessWidget {
  final String text;
  final Widget widget;
  final Widget button;
  const CustomHomeWidget({
    super.key,
    required this.text,
    required this.button,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 156,
          height: 137.92,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16.42),
            border: Border.all(width: 1.08, color: Colors.grey.shade400),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 28),
              Text(
                text,
                style: AppTextStyles.medium14,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6),
              button,
            ],
          ),
        ),
        Positioned(
          top: -47,
          left: 32,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 90.3,
            height: 90.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 1.08, color: Colors.grey.shade400),
            ),
            child: widget,
          ),
        ),
      ],
    );
  }
}
