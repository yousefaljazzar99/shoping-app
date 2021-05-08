import 'package:flutter/cupertino.dart';
import 'package:shoping/helper/extenstion.dart';

class CartProductModel {
  String name, image, price,productId;
  int quantity;

  CartProductModel({
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.productId
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map['productId'];

  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,

    };
  }
}
