import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class MealsData {
  static String apiKey = "AIzaSyCTnDZjGMzINEfbHcVUyz35xA6AQ6b7xsk";
  static String model = "models/gemini-2.5-pro"; //"models/gemini-2.5-flash";

  static String endpoint =
      "https://generativelanguage.googleapis.com/v1beta/$model:generateContent?key=$apiKey";

  Future<Map<String, dynamic>> analyzeMeal(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final base64Image = base64Encode(bytes);

    final body = {
      "contents": [
        {
          "parts": [
            {
              "text":
                  "You are a nutrition assistant. Analyze the meal in this image and return ONLY a valid JSON object with the following keys: { meal, ingredients, calories, protein, carbs, fat }. The 'ingredients' field should be a list of the main food items detected in the meal. Do not include explanations or text, only return raw JSON.",
            },
            {
              "inline_data": {"mime_type": "image/jpeg", "data": base64Image},
            },
          ],
        },
      ],
    };

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data["candidates"][0]["content"]["parts"][0]["text"];
      final cleaned = text
          .replaceAll("```json", "")
          .replaceAll("```", "")
          .trim();
      return jsonDecode(cleaned);
    } else {
      throw Exception("Failed: ${response.body}");
    }
  }
}
