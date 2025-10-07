import 'dart:io';
import 'package:smart_bites/features/scan_your_food/data/meals_data.dart';
import 'package:smart_bites/features/scan_your_food/model/meal_analysis_model.dart';

class MealRepo {
  final MealsData mealsData;

  MealRepo(this.mealsData);

  Future<MealAnalysisModel> analyzeMeal(File imageFile) async {
    final result = await mealsData.analyzeMeal(imageFile); 
    return MealAnalysisModel.fromJson(result); 
  }
}
