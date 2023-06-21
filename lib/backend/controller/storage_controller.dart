import 'package:crud_with_firebase_firestore_storage_getx/backend/constant/item_storage_constant.dart';
import 'package:crud_with_firebase_firestore_storage_getx/backend/storage/storaging.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  List imageUrl = [].obs;
  final List<String> imagePathStorage = [
    ItemStoragePath.chair,
    ItemStoragePath.table
  ];

  RxBool isLoading = false.obs;

  Future<void> getAllImage() async {
    try {
      for (final path in imagePathStorage) {
        final result = await Storaging.getImages(path);
        imageUrl.add(result);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> uploadFileController(PlatformFile pickedFile) async {
    try {
      await Storaging.uploadImage(pickedFile);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onInit() async {
    isLoading.value = true;
    getAllImage();
    isLoading.value = false;
    super.onInit();
  }
}
