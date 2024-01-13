import 'package:flutter/material.dart';
import 'package:food_flutter/models/recipe.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailsPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Image.network(
              recipe.images,
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rating: ${recipe.rating}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  'Cook Time: ${recipe.totalTime}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
