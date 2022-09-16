import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constant.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';
import '../viewmodel/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        //init: Get.put(CartViewModel()),
        init: Get.find<CartViewModel>(),
        builder: (controller) => Scaffold(
            body: controller.cartProductModel.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/empty_cart.svg',
                        width: 250,
                        height: 250,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: 'Cart Empty',
                        fontsize: 32,
                        alignment: Alignment.topCenter,
                      )
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, top: 50),
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 140,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 140,
                                        child: Image.network(
                                          controller
                                              .cartProductModel[index].image!,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: controller
                                                  .cartProductModel[index]
                                                  .name!,
                                              fontsize: 24,
                                            ),
                                            const SizedBox(height: 10),
                                            CustomText(
                                              text:
                                                  '\$${controller.cartProductModel[index].price}',
                                              color: primarycolor,
                                            ),
                                            const SizedBox(height: 20),
                                            Container(
                                              width: 120,
                                              height: 40,
                                              color: Colors.grey.shade200,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                    ),
                                                    onTap: () {
                                                      controller
                                                          .increaseQuantity(
                                                              index);
                                                      print(
                                                          'quantity = ${controller.cartProductModel[index].quantity}');
                                                    },
                                                  ),
                                                  const SizedBox(width: 20),
                                                  CustomText(
                                                    text: controller
                                                        .cartProductModel[index]
                                                        .quantity
                                                        .toString()
                                                        .padLeft(2, '0'),
                                                    alignment: Alignment.center,
                                                    fontsize: 20,
                                                    color: Colors.black,
                                                  ),
                                                  const SizedBox(width: 20),
                                                  InkWell(
                                                    child: const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20),
                                                      child: Icon(
                                                        Icons.minimize,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      if (controller
                                                              .cartProductModel[
                                                                  index]
                                                              .quantity >
                                                          1) {
                                                        controller
                                                            .decreaseQuantity(
                                                                index);
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, value) {
                                return const SizedBox(height: 15);
                              },
                              itemCount: controller.cartProductModel.length),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: 'Total',
                                  color: Colors.grey,
                                  fontsize: 22,
                                ),
                                const SizedBox(height: 15),
                                GetBuilder<CartViewModel>(
                                  init: Get.find<CartViewModel>(),
                                  builder: (controller) => CustomText(
                                    text: '\$${controller.totalprice}',
                                    color: primarycolor,
                                    fontsize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 100,
                              width: 180,
                              padding: const EdgeInsets.all(20),
                              child: CustomButton(
                                  text: 'CHECKOUT', onPressed: () {}),
                            )
                          ],
                        ),
                      ),
                    ],
                  )));
  }
}
