import 'package:flutter/material.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/widgets/listView_of_food_card_stack.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/widgets/list_view_meals_data.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/widgets/name_of_food_category_section.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/widgets/text_above_thePage.dart';
import 'package:smart_bites/widgets/custom_app_bar.dart';

class MealsCategories extends StatelessWidget {
  MealsCategories({super.key});
  static const String routeName = 'mealsCategories';
  final List<Map<String, dynamic>> mealsData = [
    {
      'imageUrl': 'assets/images/omlett.jpg',
      'nameOfTheMeals': 'Omelette',
      'numOfKcal': 250,
    },
    {
      'imageUrl': 'assets/images/cheese.jpg',
      'nameOfTheMeals': 'Scrambled Eggs',
      'numOfKcal': 200,
    },
    {
      'imageUrl': 'assets/images/omlett.jpg',
      'nameOfTheMeals': 'Pancakes',
      'numOfKcal': 350,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextAboveThePage(pageName: 'BreakFast'),

            SizedBox(height: 32),

            CustomTextFormField(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, size: 25.0),
            ),

            SizedBox(height: 160, child: ListViewOfFoodCardStack()),

            SizedBox(height: 16),

            NameOfFoodCategorySection(nameOfMeals: 'BreakFast Meals'),

            SizedBox(height: 8),

            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.4,
              child: ListViewMealsData(mealsData: mealsData),
            ),
          ],
        ),
      ),
    );
  }
}
