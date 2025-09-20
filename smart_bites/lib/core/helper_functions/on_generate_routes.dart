import 'package:flutter/material.dart';
import 'package:smart_bites/features/forgetpassword/persentation/views/forget_password_screen.dart';
import 'package:smart_bites/features/home/presentation/views/home_screen.dart';
import 'package:smart_bites/features/signin/presentation/views/sign_in_screen.dart';
import 'package:smart_bites/features/signup/presentation/views/sign_up_screen.dart';
import 'package:smart_bites/features/splash/presentation/views/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case SignInScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignInScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case ForgetPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordScreen(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
