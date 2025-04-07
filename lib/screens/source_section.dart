import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/states.dart';
import 'package:news/items/news_item.dart';
import 'package:news/screens/news_details_screen.dart';

class SourceSection extends StatelessWidget {
  SourceSection({required this.categoryId, super.key});

  String? categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSources(categoryId),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is GetSourcesLoadingState ||
              state is GetNewsDataLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetSourcesErrorState ||
              state is GetNewsDataErrorState) {
            return Center(child: Text("Some thing went Wrong"));
          } else {
            var bloc = BlocProvider.of<HomeCubit>(context);
            var list = bloc.sourceResponse?.sources ?? [];
            return Column(
              children: [
                DefaultTabController(
                    length: list.length,
                    initialIndex: bloc.selectedSource,
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      indicatorColor: Theme.of(context).unselectedWidgetColor,
                      labelColor: Theme.of(context).unselectedWidgetColor,
                      isScrollable: true,
                      onTap: (value) {
                        bloc.changeSource(value);
                      },
                      tabs: list
                          .map((e) => Tab(
                                text: e.name,
                              ))
                          .toList(),
                    )),
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
          }
        },
      ),
    );
  }
}
