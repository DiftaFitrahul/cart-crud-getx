import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  String? documentId;
  final String userName;
  final String name;
  final String createdAt;
  final bool isPaid;
  final Map<String, dynamic> items;

  CartModel(
      {this.documentId,
      required this.userName,
      required this.name,
      required this.createdAt,
      required this.isPaid,
      required this.items});

  factory CartModel.fromDocumentSnapshot(
      {required DocumentSnapshot docSnapshot}) {
    return CartModel(
        documentId: docSnapshot.id,
        userName: docSnapshot['username'] ?? '',
        name: docSnapshot['name'] ?? '',
        createdAt: docSnapshot['createdAt'] ?? '',
        isPaid: docSnapshot['isPaid'] ?? false,
        items: docSnapshot['items'] ?? {});
  }
}
