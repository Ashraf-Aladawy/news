import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/states.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({required this.onTap, super.key});

  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 10),
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            var bloc = BlocProvider.of<HomeCubit>(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Good Morning\nHere is Some News For You",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => Stack(
                            alignment: index.isEven
                                ? Alignment.bottomRight
                                : Alignment.bottomLeft,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.asset(
                                    "assets/images/${bloc.categories[index].toLowerCase()}.png",
                                    fit: BoxFit.fill,
                                  )),
                              Padding(
                                padding: index.isEven
                                    ? const EdgeInsets.only(
                                        bottom: 16, right: 16)
                                    : const EdgeInsets.only(
                                        bottom: 16, left: 16),
                                child: InkWell(
                                    onTap: () {
                                      onTap(bloc.categories[index]);
                                    },
                                    child: viewAllItem(context, index)),
                              )
                            ],
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 16,
                          ),
                      itemCount: bloc.categories.length),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget viewAllItem(BuildContext context, int index) {
    return Container(
      width: 167,
      decoration: BoxDecoration(
        color: Color(0xffA0A0A0),
        borderRadius: BorderRadius.circular(84),
      ),
      child: index.isEven
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 9, top: 9, left: 16),
                  child: Text(
                    "View All",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Theme.of(context).unselectedWidgetColor,
                  ),
                )
              ],
            )
          : Row(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(Icons.arrow_back_ios_outlined,
                      color: Theme.of(context).unselectedWidgetColor),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 9, top: 9, right: 16),
                  child: Text(
                    "View All",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
    );
  }
}
