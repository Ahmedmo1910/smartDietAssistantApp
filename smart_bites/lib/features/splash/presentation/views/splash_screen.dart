import 'package:flutter/material.dart';
import 'package:smart_bites/features/auth/signin/presentation/views/sign_in_screen.dart';
import 'package:smart_bites/features/splash/presentation/views/widgets/splash_screen_body.dart';
import 'package:smart_bites/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashScreenBody());
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, MainScreen.routeName);
    });
  }
}
