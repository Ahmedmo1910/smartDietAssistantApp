import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/features/scan_your_food/data/meals_data.dart';
import 'package:smart_bites/features/scan_your_food/data/repo/meals_repo.dart';
import 'package:smart_bites/features/scan_your_food/presentation/cubit/meal_analysis_cubit.dart';
import 'package:smart_bites/features/scan_your_food/presentation/views/widgets/scan_food_fab.dart';
import 'package:smart_bites/features/scan_your_food/presentation/views/widgets/scan_your_food_body_screen.dart';
import 'package:smart_bites/widgets/custom_app_bar.dart';

class ScanYourFoodScreen extends StatelessWidget {
  static const String routeName = 'scanYourFood';
  const ScanYourFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MealAnalysisCubit(MealRepo(MealsData())),
      child: Scaffold(
        floatingActionButton: const ScanFoodFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: customAppBar(context),
        body: const ScanYourFoodBodyScreen(),
      ),
    );
  }
}
