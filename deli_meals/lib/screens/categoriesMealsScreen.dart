import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/mealItem.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const routeName = '/category-meal';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = args['id'];
    final tital = args['title'];
    final displayedMeals =
        DUMMY_MEALS.where((meale) => meale.categories.contains(id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(tital),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
