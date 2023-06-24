import 'dart:io';
import 'package:crud_with_firebase_firestore_storage_getx/backend/controller/storage_controller.dart';
import 'package:crud_with_firebase_firestore_storage_getx/backend/firestore/firestore_functionality.dart';
import 'package:crud_with_firebase_firestore_storage_getx/controller/image_pick_controller.dart';
import 'package:crud_with_firebase_firestore_storage_getx/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProofPaymentPage extends StatelessWidget {
  final String id;
  const ProofPaymentPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final filePick = Get.put(ImagePickController());
    final phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(phoneHeight * 0.15),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBar(
                leadingWidth: 0,
                elevation: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                flexibleSpace: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.black,
                      ),
                    ),
                    const Align(
                      alignment: Alignment(0, 0),
                      child: Text(
                        'Shopping Cart',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Payment : please input image below 1 MB',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('id : $id'),
              ),
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
                      return const Placeholder();
                    }),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                    onPressed: () {
                      Get.find<ImagePickController>().selectFile();
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.black),
                    child: const Text('Select image')),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (filePick.pickedfile != null) {
                        Get.snackbar('Uploading...', 'Please wait.',
                            duration: const Duration(seconds: 3));
                        Get.put(StorageController())
                            .uploadFileController(id, filePick.pickedfile!)
                            .then((_) =>
                                FirestoreFunctionality.updatePayment(id)
                                    .then((_) => Get.offAll(const HomePage())));
                      } else {
                        Get.snackbar('Error', 'You did not pick a file');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        side: BorderSide(
                            width: 2, color: Colors.black.withOpacity(0.3))),
                    child: const Text('Submit',
                        style: TextStyle(color: Colors.black))),
              )
            ],
          ),
        ));
  }
}
