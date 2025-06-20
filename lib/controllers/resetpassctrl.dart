import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/login_ui.dart';
import 'package:get/get.dart';
class ResetpassController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _obscureText = true.obs;
  final _obscureText2 = true.obs;
  get obscureText => _obscureText.value;
  get obscureText2 => _obscureText2.value;
  set obscureText(value) => _obscureText.value = value;
  set obscureText2(value) => _obscureText2.value = value;
  String oldpassword = '123456';
  void fetchReset() {
    if (passwordController.text.isEmpty|| confirmPasswordController.text.isEmpty ) {
      Get.closeAllSnackbars();
      Get.snackbar(
          'System',
          'กรูณากรอกข้อมูลให้ครบถ้วน',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor:Colors.red,
      );
   
      return;
    }   else if (passwordController.text.length < 6) {
     Get.closeAllSnackbars();
     Get.snackbar(
          'System',
          'กรูณากรอกรหัสผ่านอย่างน้อย 6 ตัวอักษร',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
      );
    
      return;
    } else if (passwordController.text != confirmPasswordController.text) {
      Get.closeAllSnackbars();
      Get.snackbar(
          'System',
          'รหัสผ่านไม่ตรงกัน',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
      );
      return;
    }else if (passwordController.text == oldpassword || confirmPasswordController.text == oldpassword) {
      Get.closeAllSnackbars();
      Get.snackbar(
          'System',
          'รหัสผ่านนี้เคยใช้ไปแล้ว',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
    
      );
      return;
    }
    passwordController.clear();
    confirmPasswordController.clear();
    FocusScope.of(Get.context!).unfocus(); 
     Get.offAll(() => LoginUi());
    return;
  }
}
