import 'package:news/cache_sources.dart';
import 'package:news/models/NewsDataResponse.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/repo/repo.dart';

class HomeLocalDsImpl implements HomeRepo{
  @override
  Future<NewsDataResponse> getNewsData(String sourceID) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getSources(String id) async{
   try{
     SourcesResponse response = await CacheSources.getSources();
     return response;
   }catch(e){
     print('Error${e.toString()}');
     rethrow;
   }
  }

}