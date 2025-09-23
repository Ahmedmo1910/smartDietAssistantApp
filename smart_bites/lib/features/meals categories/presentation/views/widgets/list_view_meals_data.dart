import 'package:flutter/material.dart';
import 'food_category_section.dart';

class ListViewMealsData extends StatelessWidget {
  const ListViewMealsData({super.key, required this.mealsData});

  final List<Map<String, dynamic>> mealsData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: mealsData.length,
      itemBuilder: (context, index) {
        return FoodCategorySection(
          imageUrl: mealsData[index]['imageUrl'],
          nameOfTheMeals: mealsData[index]['nameOfTheMeals'],
          numOfKcal: mealsData[index]['numOfKcal'],
        );
      },
    );
  }
}
