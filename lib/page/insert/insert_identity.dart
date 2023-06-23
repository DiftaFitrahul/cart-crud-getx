import 'package:crud_with_firebase_firestore_storage_getx/controller/text_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertIdentity extends StatelessWidget {
  const InsertIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = Get.put(TextController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text('username', style: TextStyle(fontWeight: FontWeight.w500)),
        TextField(
          controller: textController.userNameController,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text('name'),
        TextField(
          controller: textController.nameController,
        )
      ],
    );
  }
}
