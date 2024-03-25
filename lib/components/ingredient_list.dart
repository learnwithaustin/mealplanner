import 'package:flutter/material.dart';

import 'ingredient_item.dart';

class IngredientList extends StatelessWidget {
  final List<dynamic> ingredients;
  const IngredientList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics:const ScrollPhysics(
          parent: NeverScrollableScrollPhysics(),
        ),
        itemCount: ingredients.length,
        itemBuilder: (context,index){

          int quantity=ingredients[index]['quantity'].toInt()?? 1;

          return IngredientItem(
            quantity: quantity.toString(),
            imageUrl: ingredients[index]['image']??'',
            measure: ingredients[index]['measure']??'',
            food: ingredients[index]['food']??''
          );
    });
  }
}
