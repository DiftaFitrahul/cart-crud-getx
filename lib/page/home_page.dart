import 'package:crud_with_firebase_firestore_storage_getx/backend/controller/storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getImageUrl = Get.put(StorageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items Sell'),
      ),
      body: Obx(
        () => getImageUrl.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: getImageUrl.imageUrl.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading:
                          Image(image: NetworkImage(getImageUrl.imageUrl[0])),
                      title: const Text('Difta'),
                      subtitle: const Text('Chair, Table'),
                      trailing: const Text('Paid'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
