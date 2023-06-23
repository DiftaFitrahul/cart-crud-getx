import 'package:crud_with_firebase_firestore_storage_getx/controller/items_number_price_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../backend/controller/storage_controller.dart';

class ItemComponent extends StatelessWidget {
  const ItemComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final numberItems = Get.put(NumberItems());
    final getImageUrl = Get.put(StorageController());
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Row(
        children: [
          SizedBox(
              width: 200,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image(image: NetworkImage(getImageUrl.imageUrl[0])),
              )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chair',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Color: brown',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 11)),
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${numberItems.chairPrice}',
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (numberItems.numberChair > 0) {
                                numberItems.numberChair.value--;
                              }
                            },
                            icon: Icon(Icons.remove),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                          Obx(() => SizedBox(
                              width: 30,
                              child: Center(
                                  child: Text(
                                      numberItems.numberChair.toString())))),
                          IconButton(
                            onPressed: () {
                              numberItems.numberChair.value++;
                            },
                            icon: Icon(Icons.add),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
