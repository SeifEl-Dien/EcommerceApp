import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/profile_view_model.dart';
import 'auth/login_screen.dart';
import 'widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Container(
                padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          /* CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/profile_pic.png'),
                      foregroundImage: controller.userModel?.pic != 'default'
                          ? NetworkImage('${controller.userModel?.pic}')
                          : null, 
                    ), */
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: const AssetImage(
                              'assets/images/profile_pic.png',
                            ),
                            foregroundImage: controller.userModel?.pic ==
                                    'default'
                                ? const AssetImage(
                                    'assets/images/profile_pic.png')
                                : NetworkImage('${controller.userModel?.pic}')
                                    as ImageProvider,
                          ),
                          const SizedBox(width: 20),
                          /*  TextButton(
                        onPressed: () {
                          print('##### model name = ' +
                              '${controller.userModel?.name}');
                          print('##### pic name = ' +
                              '${controller.userModel?.email}');
                          print('##### pic name = ' +
                              '${controller.userModel?.pic}');
                          print('##### pic name = ' +
                              '${controller.userModel?.userId}');
                        },
                        child: Text('Print')), */

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: controller.userModel!.name!,
                                color: Colors.black,
                                fontsize: 18,
                              ),
                              const SizedBox(height: 10),
                              CustomText(
                                text: controller.userModel!.email!,
                                color: Colors.black,
                                fontsize: 16,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      listTileMethod('Edit Profile', 'assets/menu_icons/1.png',
                          () => null),
                      listTileMethod('Shipping Address',
                          'assets/menu_icons/2.png', () => null),
                      listTileMethod('Order History', 'assets/menu_icons/3.png',
                          () => null),
                      listTileMethod(
                          'Cards', 'assets/menu_icons/4.png', () => null),
                      listTileMethod('Notifications', 'assets/menu_icons/5.png',
                          () => null),
                      listTileMethod('Log Out', 'assets/menu_icons/6.png', () {
                        controller.signOut();
                        Get.offAll(() => LoginScreen());
                      }),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Container listTileMethod(String title, String img, Function() onPressed) {
    return Container(
      child: TextButton(
          onPressed: onPressed,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(img),
            title: CustomText(
              text: title,
            ),
            trailing: title != 'Log Out'
                ? const Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  )
                : null,
          )),
    );
  }
}
