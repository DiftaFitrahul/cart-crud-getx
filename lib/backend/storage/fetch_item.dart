import 'package:firebase_storage/firebase_storage.dart';

class FetchItem {
  final storageRef = FirebaseStorage.instance.ref();

  Future<String> getImages(String path) async {
    try {
      final urlRef = storageRef.child(path);
      final urlFile = await urlRef.getDownloadURL();
      return urlFile;
    } on FirebaseException catch (_) {
      rethrow;
    }
  }
}
