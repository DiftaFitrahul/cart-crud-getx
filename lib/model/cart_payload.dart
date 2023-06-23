import 'dart:collection';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class CartPayload extends MapView<String, dynamic> {
  CartPayload(
      {required String userName,
      required String name,
      required String createdAt,
      required bool isPaid,
      required Map<String, dynamic> items})
      : super({
          'username': userName,
          'name': name,
          'createdAt': createdAt,
          'isPaid': isPaid,
          'items': items
        });
}
