import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ImagePickController extends GetxController {
  PlatformFile? pickedfile;

  Future<void> selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }

    pickedfile = result.files.first;
    update();
  }
}
