import 'dart:io';
import 'package:smart_bites/features/scan_your_food/model/meal_analysis_model.dart';

abstract class MealAnalysisState {
  final File? image;
  const MealAnalysisState({this.image});
}

class MealAnalysisInitial extends MealAnalysisState {
  const MealAnalysisInitial() : super(image: null);
}

class MealAnalysisLoading extends MealAnalysisState {
  const MealAnalysisLoading({super.image});
}

class MealAnalysisSuccess extends MealAnalysisState {
  final MealAnalysisModel meal;
  const MealAnalysisSuccess(this.meal, {super.image});
}

class MealAnalysisFailure extends MealAnalysisState {
  final String message;
  const MealAnalysisFailure(this.message, {super.image});
}
