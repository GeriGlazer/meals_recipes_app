import 'package:flutter/material.dart';

import 'models/filters.dart';
import 'models/meal.dart';
import 'screens/bottomTabsScreen.dart';
import 'screens/filters_screen.dart';
import 'screens/meals_screen_by_category.dart';
import 'screens/single_meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<Meal> _favoriteMeals = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      // home: CategoriesScreen(),
      //this lines is for when several pages needs to be manage
      initialRoute: '/', //default
      routes : {
        '/': (ctx) => BottomTabsScreen(_favoriteMeals),
        MealsScreenByCategory.routeName: (ctx) => MealsScreenByCategory(),
        SingleMealScreen.routeName : (ctx) => SingleMealScreen(),
        FiltersScreen.routeName : (ctx) => FiltersScreen(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
    @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
