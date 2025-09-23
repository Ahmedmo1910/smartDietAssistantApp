import 'package:flutter/material.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/widgets/listView_of_food_card_stack.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/widgets/list_view_meals_data.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/widgets/name_of_food_category_section.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/widgets/search_field.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/widgets/text_above_thePage.dart';
import 'package:smart_bites/features/meals/presentation/views/widgets/icon_in_top_left.dart';

class MealsCategories extends StatelessWidget {
  MealsCategories({super.key});

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              IconInTopLeft(),

              SizedBox(height: 10),

              TextAboveThePage(pageName: 'BreakFast'),

              SizedBox(height: 35),

              Center(child: searchField()),

              SizedBox(height: 160, child: ListViewOfFoodCardStack()),

              SizedBox(height: 30),

              NameOfFoodCategorySection(nameOfMeals: 'BreakFast Meals'),

              SizedBox(height: 20),

              SizedBox(
                height: 380,
                child: ListViewMealsData(
                  mealsData: mealsData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}