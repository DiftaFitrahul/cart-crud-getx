
import 'package:crud_with_firebase_firestore_storage_getx/backend/storage/storage_functionality.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {



  RxBool uploadLoading = false.obs;

  

  Future<void> uploadFileController(String id, PlatformFile pickedFile) async {
    try {
      uploadLoading.value = true;
      await StorageFunctionality.uploadImage(id, pickedFile);
      uploadLoading.value = false;
    } catch (e) {
      rethrow;
    }
  }

  
}
