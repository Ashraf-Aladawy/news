import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/states.dart';
import 'package:news/items/news_item.dart';
import 'package:news/items/text_field_item.dart';
import 'package:news/screens/news_details_screen.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "SearchScreen";

  SearchScreen({super.key});

  @override
  var searchWord = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            var bloc = BlocProvider.of<HomeCubit>(context);
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                  child: TextFieldItem(
                    lable: "Search",
                    validate: (value) {},
                    onSearch: (query) {
                      bloc.searchAboutNewsData(query);
                    },
                    controller: searchWord,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close)),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          Navigator.pushNamed(
                              context, NewsDetailsScreen.routeName,
                              arguments: bloc.newsModel!.articles![index]);
                        },
                        child:
                            NewsItem(data: bloc.newsModel!.articles![index])),
                    itemCount: bloc.newsModel?.articles?.length ?? 0,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
