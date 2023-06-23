import 'package:crud_with_firebase_firestore_storage_getx/controller/items_number_price_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../backend/controller/storage_controller.dart';

class ItemComponent extends StatelessWidget {
  final String imageLinkUrl;
  final int price;
  final String name;
  final String color;
  final Widget numberItem;
  final VoidCallback decrementCallback;
  final VoidCallback incrementCallback;
  const ItemComponent(
      {super.key,
      required this.name,
      required this.color,
      required this.price,
      required this.imageLinkUrl,
      required this.numberItem,
      required this.decrementCallback,
      required this.incrementCallback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 155,
      child: Row(
        children: [
          SizedBox(
              width: 200,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image(image: NetworkImage(imageLinkUrl)),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Color: $color',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 11)),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$$price',
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: decrementCallback,
                            icon: const Icon(Icons.remove),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          SizedBox(width: 30, child: Center(child: numberItem)),
                          IconButton(
                            onPressed: incrementCallback,
                            icon: const Icon(Icons.add),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
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
