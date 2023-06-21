import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items Sell'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){},
            child: const ListTile(
              title: Text('Difta'),
              subtitle: Text('Chair, Table'),
              trailing: Text('Paid'),              
            ),
          );
        },
      ),
    );
  }
}
