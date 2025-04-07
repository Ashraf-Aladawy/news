import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/states.dart';
import 'package:news/items/drawer_item.dart';
import 'package:news/screens/categories_section.dart';
import 'package:news/screens/search_screen.dart';
import 'package:news/screens/source_section.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var bloc = BlocProvider.of<HomeCubit>(context);
          return Scaffold(
              appBar: AppBar(
                title: Text(bloc.selectedCategory ?? "Home"),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      icon: Icon(
                        Icons.search_outlined,
                        color: Theme.of(context).unselectedWidgetColor,
                      ))
                ],
              ),
              drawer: DrawerItem(onTap: () {
                bloc.onGoHomeClicked(context);
              }),
              body: bloc.selectedCategory == null
                  ? CategoriesSection(onTap: (category) {
                      bloc.onCategoryClicked(category);
                    })
                  : SourceSection(categoryId: bloc.selectedCategory));
        },
      ),
    );
  }
}
