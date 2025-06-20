
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detailctrl.dart';
import '../controllers/scrollctrl.dart';
import '../widgets/homewid/LocationFilterBar.dart';
import '../widgets/homewid/formsearch.dart';
import '../widgets/homewid/rescard.dart';
import '../widgets/homewid/reslist.dart';
import '../widgets/homewid/slideim.dart';
import '../widgets/matwid/scrolltotop_bt.dart';
import 'details_ui.dart';
import 'login_ui.dart';
import 'myprofile_ui.dart';

class HomeUi extends StatelessWidget {
   HomeUi({super.key});

  
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
          backgroundColor: Colors.pink[200],
          title: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              "assets/imgs/logoHome.png",
              height: 8 *10,
              fit: BoxFit.contain,
            ),
          ),
          toolbarHeight: 8 * 12,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white, size: 30), // ไอคอนรูปฟันเฟือง
              onPressed: () {
                Get.offAll(() => MyprofileUi()); // <<< นำทางไป MyProfileUI
              },
            ),
            const SizedBox(width: 10), // เพิ่มระยะห่างเล็กน้อย
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
           
        flexibleSpace: Container( // ใช้ flexibleSpace เพื่อใส่ Gradient
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink[200]!, // สีชมพูอ่อน
                  Colors.blue[200]!, // สีชมพูอ่อน
                  
                ],
                begin: Alignment.centerLeft,
                transform: GradientRotation( 3.0),
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
            Colors.blue[200]!,
            Colors.pink[200]!,
          ])
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
                              const Formsearch(),
                              const LocationFilterBar(),
          
                              const SizedBox(height: 8),
                              Slideim(),
                              const SizedBox(height: 8),
                              // ใช้ .map เพื่อสร้าง RestaurantCard จาก restaurantList
                             ...Reslist.restaurantList.map((restaurantData) {
                                return RestaurantCard(
                                  imageUrl: restaurantData['imageUrl']!,
                                  restaurantName:
                                      restaurantData['restaurantName']!,
                                  description: restaurantData['description']!,
                                  rating: restaurantData['rating']!,
                                  isOpen: restaurantData['isOpen']!,
                                  showMotorcycleIcon:
                                      restaurantData['showMotorcycleIcon']!,
                                  onTap: () {
                                    // ใช้ Get.to พร้อม BindingsBuilder เพื่อจัดการ Controller lifecycle
                                    Get.offAll(
                                      () => RestaurantDetailPageUi(
                                            restaurantId: restaurantData['id']!,
                                          ),
                                      binding: BindingsBuilder(() {
                                        // Get.put() จะถูกเรียกเมื่อหน้านั้นถูกสร้างขึ้น
                                        // และจะถูก dispose เมื่อหน้านั้นถูก pop ออกจาก stack
                                        Get.put(
                                          RestaurantDetailController(
                                            restaurantId: restaurantData['id']!,
                                          ),
                                          tag: restaurantData['id']!, // ใช้ ID เป็น tag
                                        );
                                      }),
                                    );
                                  },
                                );
                              }),
                              const SizedBox(height: 50),
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