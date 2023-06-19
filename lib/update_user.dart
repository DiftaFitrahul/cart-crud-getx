import 'package:crud_with_firebase_firestore_storage_getx/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/user.dart';

class UpdateUser extends StatefulWidget {
  final int index;
  const UpdateUser({super.key, required this.index});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userGetx = Get.put(UserController());
    final getUser = userGetx.listUser[widget.index];
    nameController.text = getUser.name;
    descriptionController.text = getUser.description;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input User'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'name'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'description'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                userGetx.updateThisUser(
                    widget.index,
                    User(
                      name: nameController.text,
                      description: descriptionController.text,
                    ));
                Navigator.pop(context);
              },
              child: const Text('Add User'))
        ],
      ),
    );
  }
}
