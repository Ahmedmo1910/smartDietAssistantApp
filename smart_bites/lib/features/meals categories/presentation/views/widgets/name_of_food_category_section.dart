import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

// ignore: must_be_immutable
class NameOfFoodCategorySection extends StatelessWidget {
  NameOfFoodCategorySection({required this.nameOfMeals, super.key});
  String nameOfMeals;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text(nameOfMeals, style: AppTextStyles.semiBold20)],
    );
  }
}
