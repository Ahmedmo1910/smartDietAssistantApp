import 'package:flutter/material.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'package:smart_bites/features/signin/presentation/views/sign_in_screen.dart';
import 'package:smart_bites/features/signup/presentation/views/sign_up_screen.dart';
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
  
    initialRoute: SignInScreen.routeName,

    );
  }
}
