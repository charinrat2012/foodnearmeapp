import 'package:get/get.dart';
import 'package:food_near_me_app/controllers/scrollctrl.dart';
import '../controllers/slidectrl.dart'; 
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrollpageController>(() => ScrollpageController());
    Get.lazyPut<SlideController>(() => SlideController());

  }
}