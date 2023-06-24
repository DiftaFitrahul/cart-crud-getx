import 'package:crud_with_firebase_firestore_storage_getx/controller/text_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/cart_model.dart';

class UpdateIdentity extends StatelessWidget {
  final CartModel cart;
  const UpdateIdentity({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final textController = Get.put(TextController());
    textController.nameController.text = cart.name;
    textController.userNameController.text = cart.userName;
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
