import 'package:flutter/material.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'package:smart_bites/features/meals%20description/presentation/views/meals_description_screen.dart';
import 'package:smart_bites/features/meals categories/presentation/views/meals_categories_screen.dart';
//import 'package:smart_bites/features/meals%20description/presentation/views/widgets/meals_description_screen.dart';
//import 'package:smart_bites/features/meals/presentation/views/meals_screen.dart';
//import 'package:smart_bites/features/splash/presentation/views/splash_screen.dart';
import 'core/helper_functions/on_generate_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
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
      ),
      title: 'SmartBites',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      //initialRoute: SplashScreen.routeName,
      //home: SignInScreen(),
      //home: MealsScreen(),
      home: MealsCategories(),
      //home: MealsDescriptionScreen(),
    );
  }
}
