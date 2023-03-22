import 'package:flutter/material.dart';

import './category_item.dart';
import './categories_mock.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals!!'),
      ),
      body: GridView(
        children:CATEGORIES_MOCK.map((catData) => CategoryItem(
          catData.title,
          catData.color,
        ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio:  3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}