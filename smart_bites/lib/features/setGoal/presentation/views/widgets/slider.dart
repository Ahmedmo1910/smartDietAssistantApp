// custom widget ==> slider
import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

class CaloriesSlider extends StatelessWidget {
  final double currentValue;
  final double maxtValue;
  const CaloriesSlider({
    super.key,
    required this.currentValue,
    required this.maxtValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Taken",
                style: AppTextStyles.semiBold14.copyWith(color: Colors.green),
              ),
              Text("Your Calories", style: AppTextStyles.semiBold14),
            ],
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.primaryColor,
              inactiveTrackColor: Colors.grey[400],
              thumbColor: AppColors.primaryColor,
              overlayColor: AppColors.primaryColor,
              trackHeight: 10,
            ),
            child: Slider(
              value: currentValue,
              max: maxtValue,
              min: 0,
              onChanged: (value) {
                
              },
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textAlign: TextAlign.center,
                "${currentValue.toInt()}",
                style: AppTextStyles.semiBold18.copyWith(color: Colors.green),
              ),
              Text(
                "${maxtValue.toInt()}",
                style: AppTextStyles.semiBold18
              ),
            ],
          ),
        ),
      ],
    );
  }
}
