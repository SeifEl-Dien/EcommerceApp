import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login_screen.dart';
import '../viewmodel/auth_view_model.dart';
import '../viewmodel/navbar_view_model.dart';

class ControlAllScreens extends GetWidget<AuthViewModel> {
  const ControlAllScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == null
          ? LoginScreen()
          : GetBuilder<NavBarViewModel>(
              init: NavBarViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentscreen,
                bottomNavigationBar: bottomnavigationbarmethod(),
              ),
            );
    });
  }

  Widget bottomnavigationbarmethod() {
    return GetBuilder<NavBarViewModel>(
      init: Get.find<NavBarViewModel>(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text('Explore'),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/Icon_Explore.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text('Cart'),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text('Account'),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/Icon_User.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
        ],
        currentIndex: controller.navigatorvalue,
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
        onTap: (index) {
          controller.changeSelectedvalue(index);
        },
      ),
    );
  }
}
