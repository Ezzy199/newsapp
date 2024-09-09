import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/cache_sources.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/repo/repo.dart';

import '../utils/constants.dart';

class HomeRemoteDsImpl implements HomeRepo{
  @override
  Future<NewsDataResponse> getNewsData(String sourceID) async{
    Uri url =Uri.https(Constants.baseUrl,"/v2/everything",
        {

          "sources":sourceID,
        }
    );
    http.Response response = await   http.get(url,headers: {
      "x-api-key":Constants.apiKey,
    });
    var json = jsonDecode(response.body);


   return NewsDataResponse.fromJson(json);
  }

  @override
  Future<SourcesResponse> getSources(String id) async {
    try{
      Uri url = Uri.https("newsapi.org","v2/top-headlines/sources",{
        "apiKey":Constants.apiKey,"category":id
      });
      http.Response response= await http.get(url);

      var json=jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      await CacheSources.saveSources(sourcesResponse);
      return sourcesResponse;
    }catch(e){
      print("Error $e");
      rethrow;
    }


  }

}