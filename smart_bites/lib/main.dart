import 'package:flutter/material.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'package:smart_bites/features/home/presentation/AppCubit/app_cubit.dart';
import 'package:smart_bites/features/setGoal/presentation/views/set_goal_screen.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) => AppCubit()..loadPreferences(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final cubit = context.watch<AppCubit>();
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Montserrat',
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            ),
            darkTheme: ThemeData.dark(),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            title: 'SmartBites',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            initialRoute: SetGoalPage.routeName,
            // home: SignInScreen(),
          );
        },
      ),
    );
  }
}
