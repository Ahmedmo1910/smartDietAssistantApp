import 'package:flutter/material.dart';
import 'package:smart_bites/features/auth/forgetpassword/persentation/views/forget_password_screen.dart';
import 'package:smart_bites/features/home/presentation/views/home_screen.dart';
import 'package:smart_bites/features/meals%20categories/presentation/views/meals_categories_screen.dart';
import 'package:smart_bites/features/meals%20description/presentation/views/meals_description_screen.dart';
import 'package:smart_bites/features/setGoal/presentation/views/set_goal_screen.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/sign_in_screen.dart';
import 'package:smart_bites/features/auth/signup/presentation/views/sign_up_screen.dart';
import 'package:smart_bites/features/splash/presentation/views/splash_screen.dart';
import 'package:smart_bites/main_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case MainScreen.routeName:
      return MaterialPageRoute(builder: (context) => const MainScreen());
    case SignInScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignInScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case ForgetPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordScreen(),
      );

    case SetGoalScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SetGoalScreen());
    case MealsCategories.routeName:
      return MaterialPageRoute(builder: (context) => MealsCategories());
    case MealsDescriptionScreen.routeName:
      return MaterialPageRoute(builder: (context) => MealsDescriptionScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
