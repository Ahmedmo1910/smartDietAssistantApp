
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/features/meals/data/repo/recipes_repository.dart';
import 'package:smart_bites/features/meals/presentation/cubit/recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final RecipesRepository repository;
  RecipeCubit(this.repository) : super(RecipeInitial());
  Future<void> fetchRecipes() async {
    emit(RecipeLoading());
    try {
      final recipes = await repository.fetchRecipes();
      emit(RecipeLoaded(recipes: recipes));
    } on Exception catch (e) {
      emit(RecipeFailure(eMsg: e.toString()));
    }
  }
}
