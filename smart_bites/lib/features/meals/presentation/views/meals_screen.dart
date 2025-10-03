import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/meals_categories_screen.dart';
import 'package:smart_bites/features/meals/presentation/views/widgets/image_meals_screen.dart';
import 'package:smart_bites/features/meals/presentation/views/widgets/mealsConteners.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ImageMealScreen(imageUrl: 'assets/images/meal_food.png'),
          SizedBox(height: 10),
          Text('Meals', style: AppTextStyles.bold40),

          mealsContainers(
            imageUrl: Image.asset('assets/images/firstCardMeals.png'),
            cardName: 'Break Fast',
            cardDescription: 'Healthy meals to start your morning strong',
            buttonText: 'Add Breakfast',
            routeName: MealsCategories.routeName,
          ),

          SizedBox(height: 10),

          mealsContainers(
            imageUrl: Image.asset('assets/images/secondCardMeals.png'),
            cardName: 'Lunch',
            cardDescription: 'Nutritious dishes to fuel your afternoon',
            buttonText: 'Add Lunch',
            routeName: MealsCategories.routeName,
          ),

          SizedBox(height: 10),

          mealsContainers(
            imageUrl: Image.asset('assets/images/thirdCardMeals.png'),
            cardName: 'Dinner',
            cardDescription: 'Light and balanced meals for the evening',
            buttonText: 'Add Dinner',
            routeName: MealsCategories.routeName,
          ),
        ],
      ),
    );
  }
}
