import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NameOfFoodCategorySection extends StatelessWidget {
  NameOfFoodCategorySection({required this.nameOfMeals, super.key});
  String nameOfMeals;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          nameOfMeals,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(width: 180),
      ],
    );
  }
}
