import 'package:crud_with_firebase_firestore_storage_getx/controller/controller.dart';
import 'package:crud_with_firebase_firestore_storage_getx/model/user.dart';
import 'package:crud_with_firebase_firestore_storage_getx/update_user.dart';
import 'package:crud_with_firebase_firestore_storage_getx/user_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final listUserGetx = Get.put(UserController());
    return Scaffold(
      body: Obx(() => ListView.builder(
            itemCount: listUserGetx.listUser.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateUser(index: index),
                      ));
                },
                child: ListTile(
                  title: Text(listUserGetx.listUser[index].name),
                  subtitle: Text(listUserGetx.listUser[index].description),
                  trailing: IconButton(
                      onPressed: () {
                        listUserGetx.deleteUser(listUserGetx.listUser[index]);
                      },
                      icon: const Icon(Icons.delete)),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserInput(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
