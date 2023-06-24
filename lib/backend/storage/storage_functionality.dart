import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final storageRef = FirebaseStorage.instance.ref();

class StorageFunctionality {
  

  static Future<bool> uploadImage(String id, PlatformFile pickedFile) async {
    try {
      final path = 'proof_payment/$id/${pickedFile.name}';
      final file = File(pickedFile.path!);
      final ref = storageRef.child(path);
      final uploadTask = ref.putFile(file);

      await uploadTask.whenComplete(() => true);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> deleteImage(String id) async {
    final path = 'proof_payment/$id';
    try {
      await FirebaseStorage.instance.ref(path).listAll().then((value) {
        for (var element in value.items) {
          FirebaseStorage.instance.ref(element.fullPath).delete();
        }
      });
    } catch (e) {
      rethrow;
    }
  }
}
