class CartProductModel {
  String? name, image, price, productId;
  late int quantity;

  CartProductModel({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
    required this.productId,
  });
  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map['productid'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productid': productId
    };
  }
}
