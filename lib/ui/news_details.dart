import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/generated/l10n.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'newsDetails';

  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute
        .of(context)!
        .settings
        .arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.green,
        title: Text(
          S.of(context).news_title,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.network(articles.urlToImage ?? "", height: 240,),
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
            Align(
              alignment: Alignment.topRight,
              child: Text(
                articles.publishedAt!.substring(0, 10) ?? "",
                maxLines: 3,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),
            Text(
              articles.content ?? "",
              maxLines: 3,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                _launchUrl(articles.url ?? "");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(S.of(context).view_full_article,
                    maxLines: 3,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}