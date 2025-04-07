import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  NewsItem({required this.data, super.key});

  var data;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 340,
        width: double.infinity,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).unselectedWidgetColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: data.urlToImage ?? "",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              data.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.justify,
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                    child: Text(
                  data.author ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
                SizedBox(
                  width: 20,
                ),
                Text(
                  data.publishedAt?.substring(0, 10) ?? "",
                ),
              ],
            )
          ],
        ));
  }
}
