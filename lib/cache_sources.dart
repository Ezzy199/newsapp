import 'package:hive/hive.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'models/NewsDataResponse.dart';

class CacheSources {
  static Future<void> saveSources(SourcesResponse response) async {
  final directory = await getApplicationDocumentsDirectory();
   print(directory.path);
    final collection = await BoxCollection.open(
      'SourcesList',
      {'sources'},
      path: directory.path,
    );

    final sourcesBox = await collection.openBox<Map>('sources');
    await sourcesBox.put("sources", response.toJson());
    print("Saved Sources Data");

  }

  static Future<SourcesResponse> getSources() async {
    final directory = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'NewsAppV1',
      {'sources'},
      path:directory.path,
    );
    var sourcesBox = await collection.openBox<Map>('sources');
   var response = await sourcesBox.get('sources');
   print("GET Sources Data ${response}");
   return SourcesResponse.fromJson(response!);
  }
}
