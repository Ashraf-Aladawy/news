import 'package:flutter/material.dart';
import 'package:news/screens/source_section.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem.CategoryItem({required this.index, super.key});
  final int index;
  static List<String> categories = [
    "General",
    "Business",
    "Sports",
    "Technology",
    "Entertainment",
    "Health",
    "Science",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Stack(
        alignment: index.isEven ? Alignment.bottomRight : Alignment.bottomLeft,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                "assets/images/${categories[index].toLowerCase()}.png",
                fit: BoxFit.fill,
              )),
          Padding(
            padding: index.isEven
                ? const EdgeInsets.only(bottom: 16, right: 16)
                : const EdgeInsets.only(bottom: 16, left: 16),
            child: Container(
              width: 167,
              decoration: BoxDecoration(
                color: Color(0xffA0A0A0),
                borderRadius: BorderRadius.circular(84),
              ),
              child: index.isEven
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 9, top: 9, left: 16),
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
                          padding: const EdgeInsets.only(
                              bottom: 9, top: 9, right: 16),
                          child: Text(
                            "View All",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
