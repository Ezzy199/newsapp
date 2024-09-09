 import '../models/NewsDataResponse.dart';
import '../models/SourcesResponse.dart';

abstract class HomeRepo {
   Future<SourcesResponse> getSources(String id);

   Future<NewsDataResponse> getNewsData(String sourceID);
 }