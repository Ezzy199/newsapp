import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news/ui/news_item.dart';
import 'package:news/ui/tab_item.dart';


import '../models/SourcesResponse.dart';
import '../utils/API_MANAGER.dart';


class NewsUi extends StatefulWidget {
  NewsUi({super.key});

  @override
  State<NewsUi> createState() => _NewsUiState();
}

class _NewsUiState extends State<NewsUi> {
  int selectedTabIndex = 0;
  List<Sources> sources = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("something went wrong");
        }
        sources = snapshot.data?.sources ?? [];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DefaultTabController(
                  length: sources.length,
                  child: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      onTap: (value) {
                        selectedTabIndex = value;
                        setState(() {});
                      },
                      tabs: sources
                          .map((e) => TabItem(
                                sources: e,
                                isSelected:
                                    sources.elementAt(selectedTabIndex) == e,
                              ))
                          .toList())),
              FutureBuilder(
                future: ApiManager.getNewsData(sources[selectedTabIndex].id??""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text("something went wrong");
                  }
                  var articles = snapshot.data?.articles ?? [];
                  return Expanded(
                    child: ListView.separated(

                      separatorBuilder:(context, index) => SizedBox(
                        height: 8,
                      ),
                      itemBuilder: (context, index) {
                        return NewsItem(articles:articles[index]);
                      },
                      itemCount: articles.length,
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
