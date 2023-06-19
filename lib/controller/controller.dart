import 'package:get/get.dart';

import '../model/user.dart';

class UserController extends GetxController {
  List<User> listUser = <User>[].obs;

  void addUser(User user) {
    listUser.add(user);
  }

  void deleteUser(User user) {
    listUser.remove(user);
  }

  void updateThisUser(int index, User newUser) {
    listUser[index] = listUser[index].copyWith(newUser);
  }
}
