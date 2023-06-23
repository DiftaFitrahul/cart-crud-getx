import 'package:crud_with_firebase_firestore_storage_getx/component/item_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_number_price_controller.dart';

class InsertItems extends StatelessWidget {
  const InsertItems({super.key});

  @override
  Widget build(BuildContext context) {
    final numberItems = Get.put(NumberItems());
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: const SingleChildScrollView(
            child: Column(
              children: [
                ItemComponent(),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          '\$${(numberItems.numberChair.value * numberItems.chairPrice.value).toString()}.00',
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
