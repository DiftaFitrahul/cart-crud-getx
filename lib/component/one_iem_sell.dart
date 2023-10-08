import 'package:flutter/material.dart';

class OneItemSell extends StatelessWidget {
  const OneItemSell(
      {super.key,
      required this.numberItem,
      required this.imagePath,
      required this.title,
      required this.price});
  final int numberItem;
  final String imagePath;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              imagePath,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "\$$price ",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    )),
                TextSpan(text: "  x$numberItem")
              ]))
            ],
          )
        ],
      ),
    );
  }
}
