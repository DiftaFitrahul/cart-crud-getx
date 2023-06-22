import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

final storageRef = FirebaseStorage.instance.ref();

class StorageFunctionality {
  static Future<String> getImages(String path) async {
    try {
      final urlRef = storageRef.child(path);
      final urlFile = await urlRef.getDownloadURL();
      return urlFile;
    } on FirebaseException catch (_) {
      rethrow;
    }
  }

  static Future<bool> uploadImage(PlatformFile pickedFile) async {
    try {
      final path = 'proof_payment/${pickedFile.name}';
      final file = File(pickedFile.path!);
      final ref = FirebaseStorage.instance.ref().child(path);
      final uploadTask = ref.putFile(file);

      await uploadTask.whenComplete(() => true);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
