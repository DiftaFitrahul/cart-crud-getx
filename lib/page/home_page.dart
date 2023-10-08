import 'package:crud_with_firebase_firestore_storage_getx/backend/firestore/firestore_functionality.dart';
import 'package:crud_with_firebase_firestore_storage_getx/backend/storage/storage_functionality.dart';
import 'package:crud_with_firebase_firestore_storage_getx/component/item_sell_component.dart';
import 'package:crud_with_firebase_firestore_storage_getx/page/insert/cart_insert_page.dart';
import 'package:crud_with_firebase_firestore_storage_getx/page/update/cart_update_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../backend/controller/firestore_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getData = Get.put(FirestoreController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
            child: Text(
          'Items Sell',
          style: TextStyle(
              color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
        )),
      ),
      body: Obx(
        () => getData.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : getData.carts.isEmpty
                ? const Center(
                    child: Text(
                      'Empty',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : ListView.builder(
                    itemCount: getData.carts.length,
                    itemBuilder: (context, index) {
                      // return ItemSellComponent();
                      return ItemSellComponent(
                          name: getData.carts[index].name,
                          numberChair: getData.carts[index].items['chair'],
                          numberTable: getData.carts[index].items['table'],
                          onUpdate: () {
                            Get.to(CartUpdatePage(cart: getData.carts[index]));
                          },
                          onDelete: () {
                            final cartId = getData.carts[index].documentId;
                            FirestoreFunctionality.deleteCart(
                                    getData.carts[index].documentId ?? '')
                                .then((_) => StorageFunctionality.deleteImage(
                                    cartId ?? ''));
                          },
                          isPaid: getData.carts[index].isPaid);
                      // return GestureDetector(
                      //   onTap: () {
                      //     Get.to(CartUpdatePage(cart: getData.carts[index]));
                      //   },
                      //   child: ListTile(
                      //     title: Text(getData.carts[index].name),
                      //     subtitle: Text(
                      //         'Chair ${getData.carts[index].items['chair']}x, Table ${getData.carts[index].items['table']}x'),
                      //     leading: IconButton(
                      //         onPressed: () {
                      //           final cartId = getData.carts[index].documentId;
                      //           FirestoreFunctionality.deleteCart(
                      //                   getData.carts[index].documentId ?? '')
                      //               .then((_) =>
                      //                   StorageFunctionality.deleteImage(
                      //                       cartId ?? ''));
                      //         },
                      //         icon: const Icon(Icons.delete_rounded)),
                      //     trailing: getData.carts[index].isPaid
                      //         ? const Text('Paid')
                      //         : const Text('Unpaid'),
                      //   ),
                      // );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CartInsertPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
