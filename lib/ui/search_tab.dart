import 'package:flutter/material.dart';

import 'API_manegar.dart';
import 'news_item.dart';

class SearchTab extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        query ='';
        showSuggestions(context);

      }, icon: Icon(Icons.clear),),
     IconButton(onPressed: (){
     showResults(context);
     }, icon: Icon(Icons.search),),

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(onPressed: (){
   Navigator.pop(context);
   }, icon:Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return  FutureBuilder(
      future: ApiManager.getNewsData(quary: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("something went wrong");
        }
        var articles = snapshot.data?.articles ?? [];
        if (articles.isEmpty){
          return Center(child: Text('No Sources'),);
        }
        return Expanded(
          child: ListView.separated(

            separatorBuilder:(context, index) => SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewsItem(articles:articles[index]),
              );
            },
            itemCount: articles.length,
          ),
        );
      },
    );
  }



  @override
  Widget buildSuggestions(BuildContext context) {
      if (query.isEmpty){
        return Center(child: Text('Please Enter text to search'),);
      }
    return  FutureBuilder(
      future: ApiManager.getNewsData(quary: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("something went wrong");
        }
        var articles = snapshot.data?.articles ?? [];
        if (articles.isEmpty){
          return Center(child: Text('No Sources'),);
        }
        return Expanded(
          child: ListView.separated(

            separatorBuilder:(context, index) => SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewsItem(articles:articles[index]),
              );
            },
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}
