import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../model/cart_product_model.dart';
import '../model/product_model.dart';
import '../viewmodel/cart_view_model.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel model;
  const DetailsScreen({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: FittedBox(
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                child: Image.network(
                  model.image!,
                  //fill
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: model.name!,
                        fontsize: 26,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CustomText(
                                  text: 'Size',
                                ),
                                CustomText(
                                  text: model.sized!,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CustomText(
                                  text: 'Color',
                                ),
                                Container(
                                  width: 30,
                                  height: 20,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: model.color,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      const CustomText(
                        text: 'Details',
                        fontsize: 18,
                      ),
                      const SizedBox(height: 15),
                      CustomText(
                        text: model.description!,
                        height: 2,
                        fontsize: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const CustomText(
                        text: 'PRICE',
                        color: Colors.grey,
                        fontsize: 22,
                      ),
                      CustomText(
                        text: '\$${model.price}',
                        color: primarycolor,
                        fontsize: 18,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    // Get.find<CartViewModel>()
                    builder: (controller) => Container(
                      height: 100,
                      width: 180,
                      padding: const EdgeInsets.all(20),
                      child: CustomButton(
                          text: 'ADD',
                          onPressed: () {
                            controller.addProduct(CartProductModel(
                              name: model.name,
                              image: model.image,
                              price: model.price,
                              productId: model.productId,
                            ));
                          }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
