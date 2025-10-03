import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/features/meals/data/models/recipe_model.dart';
import 'package:smart_bites/features/meals/data/repo/recipes_repository.dart';
import 'package:smart_bites/features/meals/presentation/cubit/recipe_cubit.dart';
import 'package:smart_bites/features/meals/presentation/cubit/recipe_state.dart';
import 'package:smart_bites/features/meals/presentation/views/widgets/custom_meals_container.dart';

class TrackYourDailyMeals extends StatelessWidget {
  static const String routeName = 'TrackYourDailyMeals';
  const TrackYourDailyMeals({super.key});

  // late RecipeCubit recipeCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => /*recipeCubit*/
          RecipeCubit(RecipesRepository())..fetchRecipes(),
      child: Scaffold(
        appBar: AppBar(title: Text('Make your day Healthy')),
        body: BlocBuilder<RecipeCubit, RecipeState>(
          builder: (context, state) {
            if (state is RecipeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is RecipeLoaded) {
              List<RecipeModel> resipes = state.recipes;

              return ListView.builder(
                itemCount: resipes.length,
                padding: EdgeInsets.symmetric(vertical: 15),

                itemBuilder: (context, i) {
                  final recipe = resipes[i];
                  final ingredientsText = recipe.ingredients.join("\n");
                  return CustomMealsContainer(

                    imageUrl: Image.network(recipe.image),
                    cardName: recipe.name,
                    cardDescription: recipe.ingredients,
                  );
                },
              );
            } else if (state is RecipeFailure) {
              return Center(child: Text(state.eMsg));
            } else {
              return Center(child: Text('faild'));
            }
          },
        ),
      ),
    );
  }
}
