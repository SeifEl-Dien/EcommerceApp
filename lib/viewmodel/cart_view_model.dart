import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/cart_product_model.dart';
import '../service/cart_databasehelper.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double _totalprice = 0.0;
  double get totalprice => _totalprice;

  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProduct();
    getTotalPrice();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProduct();

    print('number of products = ${_cartProductModel.length}');

    _loading.value = false;
    getTotalPrice();

    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalprice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity);
      print(_totalprice);
    }
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalprice +=
        (double.parse(cartProductModel.price!) * cartProductModel.quantity);
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalprice += (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;

    _totalprice -= (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);

    update();
  }
}
