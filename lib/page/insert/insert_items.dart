import 'package:crud_with_firebase_firestore_storage_getx/backend/controller/storage_controller.dart';
import 'package:crud_with_firebase_firestore_storage_getx/component/item_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_number_price_controller.dart';

class InsertItems extends StatelessWidget {
  const InsertItems({super.key});

  @override
  Widget build(BuildContext context) {
    final numberItems = Get.put(NumberItems());
    final imageStorage = Get.put(StorageController());
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ItemComponent(
                    name: 'Chair',
                    price: numberItems.chairPrice.value,
                    color: 'silver',
                    imagePath: 'assets/items/chair.png',
                    numberItem: Obx(() => Text(
                          numberItems.numberChair.value.toString(),
                        )),
                    decrementCallback: () {
                      if (numberItems.numberChair > 0) {
                        numberItems.numberChair.value--;
                      }
                    },
                    incrementCallback: () {
                      numberItems.numberChair.value++;
                    }),
                Divider(
                  color: Colors.black.withOpacity(0.8),
                ),
                ItemComponent(
                    name: 'Table',
                    price: numberItems.tablePrice.value,
                    color: 'brown',
                    imagePath: 'assets/items/table.png',
                    numberItem: Obx(() => Text(
                          numberItems.numberTable.value.toString(),
                        )),
                    decrementCallback: () {
                      if (numberItems.numberTable > 0) {
                        numberItems.numberTable.value--;
                      }
                    },
                    incrementCallback: () {
                      numberItems.numberTable.value++;
                    }),
                Divider(
                  color: Colors.black.withOpacity(0.8),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sub total'),
                    Obx(() => Text(
                          '\$${(numberItems.numberChair.value * numberItems.chairPrice.value + numberItems.numberTable.value * numberItems.tablePrice.value).toString()}.00',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))
                  ],
                ),
              ),
              Text(
                '(Total does not include shipping)',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 11),
              )
            ],
          ),
        )
      ],
    );
  }
}
