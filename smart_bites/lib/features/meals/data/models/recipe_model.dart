class RecipeModel {
  final int id;
  final String name;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;
  final int caloriesPerServing;

  RecipeModel({
    required this.ingredients,
    required this.name,
    required this.image,
    required this.id,
    required this.instructions,
    required this.caloriesPerServing,
  });
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      ingredients: List<String>.from(json['ingredients'] ?? []),
       instructions: List<String>.from(json['instructions'] ?? []),
      caloriesPerServing: json['caloriesPerServing'] ?? 0,
    );
  }
}
