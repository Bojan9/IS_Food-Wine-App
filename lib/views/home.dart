import 'package:flutter/material.dart';
import 'package:food_flutter/models/recipe.api.dart';
import 'package:food_flutter/models/recipe.dart';
import 'package:food_flutter/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    try {
      List<Recipe> fetchedRecipes = await RecipeApi.getRecipes();
      setState(() {
        recipes = fetchedRecipes;
      });
    } catch (e) {
      // Handle error
      print('Error loading recipes: $e');
    }
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
            Text('Food Recipes'),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            name: recipes[index].name,
            caloryCount: recipes[index].caloryCount.toString(),
            type: recipes[index].type.toString(),
            imageUrl: recipes[index].imageUrl,
          );
        },
      ),
    );
  }
}
