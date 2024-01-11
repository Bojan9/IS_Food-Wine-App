import 'dart:convert';
import 'package:food_flutter/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipes() async {
    final response = await http.get(
      Uri.parse('https://localhost:7026/api/v1/Recipe'),
      headers: {
        "accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Recipe> recipes = data.map((json) => Recipe.fromJson(json)).toList();
      return recipes;
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
