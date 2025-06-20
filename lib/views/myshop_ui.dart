import 'package:flutter/material.dart';
import 'package:food_near_me_app/widgets/myshopwid/shoplist.dart';
import 'package:get/get.dart';

import '../controllers/detailctrl.dart';

import '../controllers/scrollctrl.dart';

import 'details_ui.dart';
import 'login_ui.dart';

import '../widgets/matwid/scrolltotop_bt.dart';

import '../widgets/myshopwid/shopcard.dart';

class MyshopUi extends StatelessWidget {
  const MyshopUi({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              "assets/imgs/logoHome.png",
              height: 8 * 10,
              fit: BoxFit.contain,
            ),
          ),
          toolbarHeight: 8 * 12,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                Get.offAll(LoginUi());
              },
              child: const Text(
                "ล็อคอิน",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink[200]!, Colors.blue[200]!],
                begin: Alignment.centerLeft,
                transform: GradientRotation(3.0),
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[200]!, Colors.pink[200]!],
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          controller: scrollpageController.scrollController,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ...Shoplist.shopList.map((restaurantData) {
                                return MyShopCard(
                                  imageUrl: restaurantData['imageUrl']!,
                                  restaurantName:
                                      restaurantData['restaurantName']!,
                                  description: restaurantData['description']!,
                                  rating: restaurantData['rating']!,
                                  isOpen: restaurantData['isOpen']!,
                                  showMotorcycleIcon:
                                      restaurantData['showMotorcycleIcon']!,
                                  onTap: () {
                                    Get.offAll(
                                      () => RestaurantDetailPageUi(
                                        restaurantId: restaurantData['id']!,
                                      ),
                                      binding: BindingsBuilder(() {
                                        Get.put(
                                          RestaurantDetailController(
                                            restaurantId: restaurantData['id']!,
                                          ),
                                          tag: restaurantData['id']!,
                                        );
                                      }),
                                    );
                                  },
                                );
                              }).toList(),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => scrollpageController.showScrollToTopButton.value
                    ? Positioned(
                        right: 20.0,
                        bottom: MediaQuery.of(context).padding.bottom + 16.0,
                        child: ScrollToTopButton(
                          onPressed: scrollpageController.scrollToTop,
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
