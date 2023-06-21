import 'dart:io';

import 'package:crud_with_firebase_firestore_storage_getx/backend/controller/storage_controller.dart';
import 'package:crud_with_firebase_firestore_storage_getx/controller/image_pick_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final filePick = Get.put(ImagePickController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Upload data to storage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: GetBuilder<ImagePickController>(
                    init: ImagePickController(),
                    builder: (controller) {
                      if (controller.pickedfile != null) {
                        return Image.file(
                          File(controller.pickedfile!.path!),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }
                      return const Text('Kosong');
                    }),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.find<ImagePickController>().selectFile();
                  },
                  child: const Text('Upload File')),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (filePick.pickedfile != null) {
                      Get.put(StorageController())
                          .uploadFileController(filePick.pickedfile!);
                    }
                  },
                  child: const Text('Upload Image'))
            ],
          ),
        ));
  }
}
