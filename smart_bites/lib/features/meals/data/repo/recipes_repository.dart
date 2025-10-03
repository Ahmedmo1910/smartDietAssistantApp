import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:smart_bites/features/meals/data/models/recipe_model.dart';

class RecipesRepository {
  Future<List<RecipeModel>> fetchRecipes() async {
    final responce = await http.get(Uri.parse('https://dummyjson.com/recipes'));
    if (responce.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(responce.body);
      List<dynamic> recipeJson = data['recipes'];
      List<RecipeModel> recipes = recipeJson
          .map((e) => RecipeModel.fromJson(e))
          .toList();
      return recipes;
    } else {
      throw Exception("faild to get recipes");
    }
  }
}
