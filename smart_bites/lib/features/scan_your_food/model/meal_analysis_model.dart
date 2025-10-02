class MealAnalysisModel {
  final String meal;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;
  final List<String> ingredients;

  MealAnalysisModel({
    required this.meal,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.ingredients,
  });

  factory MealAnalysisModel.fromJson(Map<String, dynamic> json) {
    return MealAnalysisModel(
      meal: json['meal'] ?? "unknown",
      calories: (json['calories'] ?? 0).toDouble(),
      protein: (json['protein'] ?? 0).toDouble(),
      carbs: (json['carbs'] ?? 0).toDouble(),
      fat: (json['fat'] ?? 0).toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
    );
  }
}

