// home.dart
import 'package:flutter/material.dart';
import 'package:food_flutter/models/recipe.api.dart';
import 'package:food_flutter/models/recipe.dart';
import 'package:food_flutter/views/widgets/recipe_card.dart';
import 'package:food_flutter/views/recipe_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  void _navigateToRecipeDetails(Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RecipeDetailsPage(recipe: recipe)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Recipe'),
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _navigateToRecipeDetails(_recipes[index]),
                  child: RecipeCard(
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime,
                    rating: _recipes[index].rating.toString(),
                    thumbnailUrl: _recipes[index].images,
                  ),
                );
              },
            ),
    );
  }
}
