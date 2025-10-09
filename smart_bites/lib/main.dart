import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'package:smart_bites/core/presentation/cubits/theme/theme_cubit.dart';
import 'package:smart_bites/core/services/custom_bloc_observer.dart';
import 'package:smart_bites/features/splash/presentation/views/splash_screen.dart';
import 'package:smart_bites/firebase_options.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'core/presentation/cubits/theme/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 Bloc.observer = CustomBlocObserver();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupGetIt();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit()..loadTheme(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final themeCubit = context.watch<ThemeCubit>();
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Montserrat',
              scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            ),
            darkTheme: ThemeData.dark().copyWith(
              textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'Montserrat',
              ),
            ),
            themeMode: themeCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            themeAnimationDuration: Durations.short1,
            title: 'SmartBites',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashScreen.routeName,
          );
        },
      ),
    );
  }
}
