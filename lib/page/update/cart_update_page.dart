import 'package:crud_with_firebase_firestore_storage_getx/backend/firestore/firestore_functionality.dart';
import 'package:crud_with_firebase_firestore_storage_getx/controller/items_number_price_controller.dart';
import 'package:crud_with_firebase_firestore_storage_getx/controller/text_editing_controller.dart';
import 'package:crud_with_firebase_firestore_storage_getx/model/cart_model.dart';
import 'package:crud_with_firebase_firestore_storage_getx/page/proof_payment_page.dart';
import 'package:crud_with_firebase_firestore_storage_getx/page/update/update_identity.dart';
import 'package:crud_with_firebase_firestore_storage_getx/page/update/update_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../backend/controller/storage_controller.dart';

class CartUpdatePage extends StatelessWidget {
  final CartModel cart;
  const CartUpdatePage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    Get.put(StorageController());
    final textController = Get.put(TextController());
    final itemsController = Get.put(NumberItems());
    itemsController.numberChair.value = cart.items['chair'];
    itemsController.numberTable.value = cart.items['table'];
    final phoneHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                    height: phoneHeight * 0.5,
                    child: TabBarView(children: [
                      UpdateIdentity(cart: cart),
                      UpdateItems(cart: cart)
                    ])),
                cart.isPaid
                    ? ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 60),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            side: BorderSide(
                                width: 2,
                                color: Colors.black.withOpacity(0.3))),
                        child: const Text('Finish Paid',
                            style: TextStyle(color: Colors.black)))
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              if (textController
                                      .userNameController.text.isNotEmpty &&
                                  textController
                                      .nameController.text.isNotEmpty &&
                                  (itemsController.numberChair.value != 0 ||
                                      itemsController.numberTable.value != 0)) {
                                FirestoreFunctionality.updateCart(CartModel(
                                    documentId: cart.documentId,
                                    userName:
                                        textController.userNameController.text,
                                    name: textController.nameController.text,
                                    createdAt: DateTime.now().toString(),
                                    isPaid: false,
                                    items: {
                                      'chair':
                                          itemsController.numberChair.value,
                                      'table': itemsController.numberTable.value
                                    })).then((_) => Get.to(ProofPaymentPage(
                                    id: cart.documentId ?? '')));
                              } else {
                                Get.snackbar('Error',
                                    'Please insert the identity and items');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 60),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                backgroundColor: Colors.black),
                            child: const Text('Checkout')),
                      ),
                cart.isPaid
                    ? const SizedBox()
                    : ElevatedButton(
                        onPressed: () {
                          if (textController
                                  .userNameController.text.isNotEmpty &&
                              textController.nameController.text.isNotEmpty &&
                              (itemsController.numberChair.value != 0 ||
                                  itemsController.numberTable.value != 0)) {
                            FirestoreFunctionality.updateCart(CartModel(
                                documentId: cart.documentId,
                                userName:
                                    textController.userNameController.text,
                                name: textController.nameController.text,
                                createdAt: DateTime.now().toString(),
                                isPaid: false,
                                items: {
                                  'chair': itemsController.numberChair.value,
                                  'table': itemsController.numberTable.value
                                })).then((_) => Get.back());
                          } else {
                            Get.snackbar('Error',
                                'Please insert the identity and items');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 60),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            side: BorderSide(
                                width: 2,
                                color: Colors.black.withOpacity(0.3))),
                        child: const Text('Pay Later',
                            style: TextStyle(color: Colors.black))),
                const SizedBox(
                  height: 90,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
