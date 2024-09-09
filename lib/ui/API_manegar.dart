import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/NewsDataResponse.dart';
import '../models/SourcesResponse.dart';
import '../utils/constants.dart';


class ApiManager {
  // https://newsapi.org/v2/top-headlines/sources?apiKey=
  static Future<SourcesResponse> getSources(String category) async {
    Uri url = Uri.https("newsapi.org","v2/top-headlines/sources",
        {"apiKey": "c6f6fed5d4e34dcabfd0ee601768981d", "category": category});
    http.Response resposne = await http.get(url);
    Map<String, dynamic> json = jsonDecode(resposne.body);

    return SourcesResponse.fromJson(json);
  }

  static Future<NewsDataResponse> getNewsData(
      {String? sourceId, String? quary, }) async {
    Uri url = Uri.https(Constants.baseUrl,"/v2/everything", {
      "sources": sourceId,
      "q": quary,

    });
    var resposne = await http
        .get(url, headers: {"x-api-key": "c6f6fed5d4e34dcabfd0ee601768981d"});

    var json = jsonDecode(resposne.body);
    return NewsDataResponse.fromJson(json);
  }
}
