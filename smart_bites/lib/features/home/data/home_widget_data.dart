import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_home_widget.dart';
import 'package:smart_bites/features/scan_your_food/presentation/views/scan_your_food_screen.dart';
import 'package:smart_bites/features/meals/presentation/views/track_your_daily_meals.dart';
import 'package:smart_bites/features/setGoal/presentation/views/set_goal_screen.dart';

List<CustomHomeWidget> getHomeWidget = [
  CustomHomeWidget(
    text: 'Track your daily calorie',
    widget: Image.asset(
      'assets/images/kcal.png',
      fit: BoxFit.contain,
      isAntiAlias: true,
    ),
    buttonText: 'Set Goal',
    routeName: SetGoalScreen.routeName,
  ),
  CustomHomeWidget(
    text: 'Log your daily exercise',
    widget: SvgPicture.asset('assets/images/workout.svg', fit: BoxFit.contain),
    buttonText: 'Exercise',
  ),
  CustomHomeWidget(
    text: 'Track your daily meals',
    widget: SvgPicture.asset('assets/images/chef.svg', fit: BoxFit.contain),
    buttonText: 'Meals',
    routeName: TrackYourDailyMeals.routeName,
  ),
  CustomHomeWidget(
    text: 'Scan your food quickly',
    widget: Icon(Icons.qr_code_scanner, size: 50, color: Colors.black),
    buttonText: 'Start scan',
    routeName: ScanYourFoodScreen.routeName,
  ),
];
