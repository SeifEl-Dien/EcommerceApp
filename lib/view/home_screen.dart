import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../viewmodel/home_view_model.dart';
import 'details_screen.dart';
import 'widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  final List names = ['Men', 'Women', 's', 's', 's'];

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Column(
              children: [
                _searchtextformfield(),
                const SizedBox(height: 30),
                const CustomText(
                  text: 'Categories',
                ),
                const SizedBox(height: 30),
                _listviewcategories(),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(
                      text: 'Best Selling',
                      fontsize: 18,
                    ),
                    CustomText(
                      text: 'See All',
                      fontsize: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _listviewproducts()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listviewproducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => SizedBox(
        height: 350,
        child: ListView.separated(
            itemCount: controller.productmodel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() =>
                      DetailsScreen(model: controller.productmodel[index]));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.shade100),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 220,
                          child: Image.network(
                            controller.productmodel[index].image!,
                            fit: BoxFit.cover,
                            //fill
                          )),
                      const SizedBox(height: 10),
                      CustomText(
                        text: controller.productmodel[index].name!,
                        alignment: Alignment.bottomLeft,
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        text: controller.productmodel[index].description
                            .toString(),
                        alignment: Alignment.bottomLeft,
                        color: Colors.grey,
                        maxlines: 1,
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        text: '\$${controller.productmodel[index].price}',
                        alignment: Alignment.bottomLeft,
                        color: primarycolor,
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 20)),
      ),
    );
  }

  Widget _listviewcategories() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              height: 100,
              child: ListView.separated(
                  itemCount: controller.categorymodel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.shade100),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(controller
                                .categorymodel[index].image
                                .toString()),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomText(
                          text: controller.categorymodel[index].name!,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20)),
            ),
    );
  }

  Widget _searchtextformfield() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }
}
