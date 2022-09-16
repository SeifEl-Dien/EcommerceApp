import 'package:ecommerce/helper/colorextension.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? name, image, description, sized, price, productId;
  Color? color;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.sized,
    required this.price,
    required this.productId,
  });
  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productId = map['productid'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productid': productId,
    };
  }
}
