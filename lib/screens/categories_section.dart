import 'package:flutter/material.dart';
import 'package:news/items/category_item.dart';

class CategoriesSection extends StatelessWidget {
   const CategoriesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    CategoryItem.CategoryItem(index: index),
                separatorBuilder: (context, index) => SizedBox(
                  height: 16,
                ),
                itemCount: CategoryItem.categories.length),
          )
        ],
      ),
    );
  }
}
