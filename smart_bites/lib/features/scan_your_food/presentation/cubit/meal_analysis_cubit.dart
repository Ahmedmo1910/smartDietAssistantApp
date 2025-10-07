import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/features/scan_your_food/data/repo/meals_repo.dart';
import 'package:smart_bites/features/scan_your_food/model/meal_analysis_model.dart';
import 'package:smart_bites/features/scan_your_food/presentation/cubit/meal_analysis_state.dart';

class MealAnalysisCubit extends Cubit<MealAnalysisState> {
  final MealRepo mealRepo;

  MealAnalysisCubit(this.mealRepo) : super(const MealAnalysisInitial());

  Future<void> analyzeMeal(File imageFile) async {
    emit(MealAnalysisLoading(image: imageFile));
    try {
      final MealAnalysisModel meal = await mealRepo.analyzeMeal(imageFile);
      emit(MealAnalysisSuccess(meal, image: imageFile));
    } catch (e) {
      emit(MealAnalysisFailure(e.toString(), image: imageFile));
    }
  }
}
