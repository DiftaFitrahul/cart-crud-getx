import 'package:crud_with_firebase_firestore_storage_getx/backend/firestore/firestore_functionality.dart';
import 'package:crud_with_firebase_firestore_storage_getx/model/cart_model.dart';
import 'package:get/get.dart';

class FirestoreController extends GetxController {
  Rx<List<CartModel>> cartList = Rx<List<CartModel>>([]);
  List<CartModel> get carts => cartList.value;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    cartList.bindStream(FirestoreFunctionality.cartStream());
    isLoading.value = false;
    super.onReady();
  }

  @override
  void onInit() {
    isLoading.value = true;
    super.onInit();
  }


}
