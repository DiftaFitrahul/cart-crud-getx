import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_with_firebase_firestore_storage_getx/model/cart_model.dart';
import 'package:crud_with_firebase_firestore_storage_getx/model/cart_payload.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class FirestoreFunctionality {
  static Future<void> addCart(CartModel cartModel) async {
    try {
      await firebaseFirestore.collection('carts').add(CartPayload(
          userName: cartModel.userName,
          name: cartModel.name,
          createdAt: cartModel.createdAt,
          isPaid: cartModel.isPaid,
          items: cartModel.items));
    } catch (e) {
      rethrow;
    }
  }

  static Stream<List<CartModel>> cartStream() {
    return firebaseFirestore.collection('carts').snapshots().map((event) {
      List<CartModel> carts = [];
      for (var cart in event.docs) {
        final cartModel = CartModel.fromDocumentSnapshot(docSnapshot: cart);
        carts.add(cartModel);
      }
      return carts;
    });
  }

  static Future<void> updateCart(CartModel cartModel) async {
    try {
      await firebaseFirestore
          .collection('carts')
          .doc(cartModel.documentId)
          .update((CartPayload(
              userName: cartModel.userName,
              name: cartModel.name,
              createdAt: cartModel.createdAt,
              isPaid: cartModel.isPaid,
              items: cartModel.items)));
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> deleteCart(CartModel cartModel) async {
    try {
      await firebaseFirestore
          .collection('carts')
          .doc(cartModel.documentId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
