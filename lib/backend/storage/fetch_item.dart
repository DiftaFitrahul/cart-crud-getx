import 'package:firebase_storage/firebase_storage.dart';

final storageRef = FirebaseStorage.instance.ref();

class FetchItem {
  static Future<String> getImages(String path) async {
    try {
      final urlRef = storageRef.child(path);
      final urlFile = await urlRef.getDownloadURL();
      return urlFile;
    } on FirebaseException catch (_) {
      rethrow;
    }
  }
}
