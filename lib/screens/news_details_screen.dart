import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/news_data_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = "NewsDetails";

  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.source!.name ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                data.title ?? "",
                maxLines: 4,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data.description ?? "",
                maxLines: 3,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "By ",
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    data.author!.split(" ").first,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        decorationThickness: 2),
                  ),
                ],
              ),
              Text(
                data.publishedAt!.substring(0, 10) ?? "",
                maxLines: 3,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: data.urlToImage ?? "",
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: 5,
              ),
              Divider(
                indent: 15,
                endIndent: 15,
              ),
              Text(
                data.content ?? "",
                maxLines: 20,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
