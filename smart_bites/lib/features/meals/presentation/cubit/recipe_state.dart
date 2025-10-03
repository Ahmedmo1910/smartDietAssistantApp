

import 'package:smart_bites/features/meals/data/models/recipe_model.dart';

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<RecipeModel> recipes;

  RecipeLoaded({required this.recipes});
}

class RecipeFailure extends RecipeState {
  final String eMsg;

  RecipeFailure({required this.eMsg});
}
