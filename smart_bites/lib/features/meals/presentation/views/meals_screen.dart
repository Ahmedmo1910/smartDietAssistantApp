import 'package:flutter/material.dart';
import 'package:smart_bites/features/meals/presentation/views/widgets/icon_in_top_left.dart';
import 'package:smart_bites/features/meals/presentation/views/widgets/image_meals_screen.dart';
import 'package:smart_bites/features/meals/presentation/views/widgets/mealsConteners.dart';
import 'package:smart_bites/features/meals/presentation/views/widgets/text-page-name.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            IconInTopLeft(),

            SizedBox(height: 10),

            ImageMealScreen(imageUrl: 'assets/images/meal_food.png'),

            SizedBox(height: 10),

            PageName(textNamePage: 'Meals'),

            SizedBox(height: 10),

            mealsContainers(
              imageUrl: 'assets/images/firstCardMeals.png',
              cardName: 'Break Fast',
              cardDescription: 'Healthy meals to start your morning strong',
              buttonText: 'Add Breakfast',
            ),

            SizedBox(height: 10),

            mealsContainers(
              imageUrl: 'assets/images/secondCardMeals.png',
              cardName: 'Lunch',
              cardDescription: 'Nutritious dishes to fuel your afternoon',
              buttonText: 'Add Lunch',
            ),

            SizedBox(height: 10),

            mealsContainers(
              imageUrl: 'assets/images/thirdCardMeals.png',
              cardName: 'Dinner',
              cardDescription: 'Light and balanced meals for the evening',
              buttonText: 'Add Dinner',
            ),
          ],
        ),
      ),
    );
  }
}
