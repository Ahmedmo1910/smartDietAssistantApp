import 'package:flutter/material.dart';
import 'package:smart_bites/features/signin/presentation/views/sign_in_screen.dart';
import 'package:smart_bites/features/splash/presentation/views/splash_screen.dart';
import 'core/helper_functions/on_generate_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        /*colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFFFFF),
        ),*/
      ),
      title: 'SmartBites',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      // initialRoute: SplashScreen.routeName, 
      home: SignInScreen(),
    );
  }
}
