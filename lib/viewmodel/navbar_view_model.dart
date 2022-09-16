import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/cart_screen.dart';
import '../view/home_screen.dart';
import '../view/profile_screen.dart';

class NavBarViewModel extends GetxController {
  int _navigatorvalue = 0;
  get navigatorvalue => _navigatorvalue;

  Widget _currentscreen = HomeScreen();
  get currentscreen => _currentscreen;

  void changeSelectedvalue(int selectedValue) {
    _navigatorvalue = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentscreen = HomeScreen();
        break;
      case 1:
        _currentscreen = const CartScreen();
        break;
      case 2:
        _currentscreen = const ProfileScreen();
        break;
      default:
    }
    update();
  }
}
