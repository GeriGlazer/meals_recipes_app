import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../data/categories_mock.dart';
import '../models/filters.dart';

class MealsScreenByCategory extends StatelessWidget {
  const MealsScreenByCategory({super.key});

  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // const MealsScreenByCategory(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    //this lines is for passing arguments from an other screen via routing in
    // pushNamed method instead of gridViewChildren() method
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    bool setFlag(bool filter, bool meal){
      if (filter){
        if (meal)return true;
        else return false;
      }
      else return true;
    }

    var categoryMeals = MEALS_MOCK.where((meal) {
      var glutenFree = false;
      var vegetarian = false;
      var vegan = false;
      var lactoseFree = false;

      glutenFree = setFlag(Filters.gluten, meal.isGlutenFree);
      vegetarian = setFlag(Filters.vegetarian, meal.isVegetarian);
      vegan = setFlag(Filters.vegan, meal.isVegan);
      lactoseFree = setFlag(Filters.lactose, meal.isLactoseFree);

      if (glutenFree == true && vegetarian == true && vegan == true && lactoseFree == true)
        return meal.categories.contains(categoryId);
      else return false;
    }).toList();
    
    Widget mealsInCategory (Widget child){ 
      if( categoryMeals.isEmpty){ 
        return Center(child:
            Container(child:
              const Text("Uh oh... nothing in here!!",)
            ),
        );
      }else return child;
    }

    return Platform.isIOS?
    CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(categoryTitle!),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      child: mealsInCategory(CupertinoFormSection.insetGrouped(
        children: [
          ...List.generate(categoryMeals.length, (index) => MealItem(
              meal: categoryMeals[index],)
          ),
        ],
      )),
    )
        : Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: mealsInCategory(ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
              meal: categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),)
    );
  }
}
