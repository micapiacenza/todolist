import 'package:hive/hive.dart';

class HiveService {
  Future<CollectionBox<Map<dynamic, dynamic>>> getBox(String boxName) async {
    // Create box collection
    final collection = await BoxCollection.open('app', { boxName }, path: './');
    final box = await collection.openBox<Map>(boxName);

    return box;
  }
}