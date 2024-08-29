import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsDataResponse.dart';



import '../models/SourcesResponse.dart';
import 'constants.dart';


class ApiManager{



 static Future<SourcesResponse> getSources() async{

 Uri url = Uri.https("newsapi.org","v2/top-headlines/sources",{
   "apiKey":"fc6839489af64cad9e6690a62e3f9e6a"
 });
 http.Response response= await http.get(url);

 var json=jsonDecode(response.body);

 SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
 return sourcesResponse;
  }
static Future<NewsDataResponse> getNewsData(String sourceID) async{
  Uri url =Uri.https(Constants.baseUrl,"/v2/everything",
  {

   "sources":sourceID,
  }
  );
  http.Response response = await   http.get(url,headers: {
   "x-api-key":Constants.apiKey,
  });
  var json = jsonDecode(response.body);
  print(json);
  NewsDataResponse model = NewsDataResponse.fromJson(json);
  return model;

  }
}