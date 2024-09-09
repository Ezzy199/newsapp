import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:news/ui/news_details.dart';

class NewsItem extends StatelessWidget {
  Articles articles;
  NewsItem({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
    Navigator.pushNamed(context, NewsDetails.routeName,arguments: articles);
      },
      child: Container  (
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(articles.urlToImage ?? "",height: 240,)),
            Text(
              articles.source?.name ?? "",
              style: TextStyle(
                fontSize: 12,
                color: Colors.green,
              ),
            ),
            Text(
              articles.title ?? "",
              style: TextStyle(
                fontSize: 22,
                color: Color(0xff242424),
              ),
            ),
            Text(
              articles.description ?? "",
              maxLines: 3,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              articles.publishedAt?.substring(0, 10) ?? "",
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
