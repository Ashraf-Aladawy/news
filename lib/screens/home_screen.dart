import 'package:flutter/material.dart';
import 'package:news/items/category_item.dart';
import 'package:news/screens/categories_section.dart';
import 'package:news/screens/source_section.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: Theme.of(context).unselectedWidgetColor,
              ))
        ],
      ),
      drawer: Drawer(),
      body: CategoriesSection()
    );
  }
}
