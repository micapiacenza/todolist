import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> setupHive() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
}

class HiveService {
  Future<CollectionBox<Map<dynamic, dynamic>>> getBox(String boxName) async {
    // Create box collection
    final dir = await path_provider.getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open('app', { boxName }, path: dir.path);
    final box = await collection.openBox<Map>(boxName);

    return box;
  }
}