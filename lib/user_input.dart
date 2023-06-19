import 'package:crud_with_firebase_firestore_storage_getx/controller/controller.dart';
import 'package:crud_with_firebase_firestore_storage_getx/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key});

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userGetx = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input User'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'name'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(hintText: 'description'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                userGetx.addUser(User(
                    name: _nameController.text,
                    description: _descriptionController.text));
                Navigator.pop(context);
              },
              child: const Text('Add User'))
        ],
      ),
    );
  }
}
