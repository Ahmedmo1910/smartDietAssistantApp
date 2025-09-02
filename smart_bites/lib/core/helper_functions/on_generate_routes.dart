import 'package:flutter/material.dart';
import 'package:smart_bites/features/home/presentation/views/home_screen.dart';
import 'package:smart_bites/features/splash/presentation/views/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
