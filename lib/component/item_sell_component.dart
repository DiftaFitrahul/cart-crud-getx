import 'package:crud_with_firebase_firestore_storage_getx/component/one_iem_sell.dart';
import 'package:flutter/material.dart';

class ItemSellComponent extends StatelessWidget {
  const ItemSellComponent(
      {super.key,
      required this.name,
      required this.numberChair,
      required this.numberTable,
      required this.onDelete,
      required this.isPaid,
      required this.onUpdate});
  final String name;
  final int numberChair;
  final int numberTable;
  final VoidCallback onDelete, onUpdate;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onUpdate,
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "$name ",
                    style: const TextStyle(fontSize: 20),
                  ),
                  TextSpan(
                      text: isPaid ? "Paid" : "Unpaid",
                      style: TextStyle(
                          color: isPaid ? Colors.blue : Colors.red,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900))
                ])),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline_outlined))
            ],
          ),
          const Divider(
            height: 20,
            color: Colors.black,
          ),
          numberChair == 0
              ? const SizedBox()
              : OneItemSell(
                  numberItem: numberChair,
                  imagePath: 'assets/items/chair.png',
                  title: 'Chair',
                  price: '500'),
          const SizedBox(
            height: 8,
          ),
          numberTable == 0
              ? const SizedBox()
              : OneItemSell(
                  numberItem: numberTable,
                  imagePath: 'assets/items/table.png',
                  title: 'Table',
                  price: '1100'),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Harga : ",
                style: TextStyle(fontSize: 17),
              ),
              Text(
                '\$${numberChair * 500 + numberTable * 1100}',
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              )
            ],
          )
        ],
      ),
    );
  }
}
