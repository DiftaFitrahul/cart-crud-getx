import 'package:crud_with_firebase_firestore_storage_getx/page/insert/insert_identity.dart';
import 'package:crud_with_firebase_firestore_storage_getx/page/insert/insert_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartInsertPage extends StatelessWidget {
  const CartInsertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final heightPreferedSize = MediaQuery.of(context).size.height * 0.16;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(heightPreferedSize),
          child: SafeArea(
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.black,
                ),
              ),
              flexibleSpace: const Align(
                alignment: Alignment(0, 0),
                child: Text(
                  'Shopping Cart',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.person_2_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                      icon: Icon(Icons.shopping_cart_outlined,
                          color: Colors.black))
                ],
                indicatorColor: Colors.black,
              ),
            ),
          ),
        ),
        body: const TabBarView(children: [InsertItems(), InsertIdentity()]),
      ),
    );
  }
}
