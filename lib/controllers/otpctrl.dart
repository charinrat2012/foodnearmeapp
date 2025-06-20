import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/resetpass.dart';
import 'package:get/get.dart';
class OtpCotroller extends GetxController {
  final int fields;
  String otp = '12345';
  final List<TextEditingController> otpcontroller;
  OtpCotroller({this.fields = 5})
    : otpcontroller = List.generate(fields, (index) => TextEditingController());
  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < otpcontroller.length; i++) {
      otpcontroller[i].addListener(() {
        if (otpcontroller[i].text.length == 1 && i < otpcontroller.length - 1) {
          if (Get.context != null) {
            FocusScope.of(Get.context!).nextFocus();
          }
        } else if (otpcontroller[i].text.isEmpty && i > 0) {
          if (Get.context != null) {
            FocusScope.of(Get.context!).previousFocus();
          }
        }
      });
    }
  }
  @override
  void onClose() {
    for (var controller in otpcontroller) {
      controller.dispose();
    }
    super.onClose();
  }
  String getOtpValue() {
    return otpcontroller.map((controller) => controller.text).join();
  }
  void clearOtpFields() {
    for (var controller in otpcontroller) {
      controller.clear();
    }
  }
  void verifyOtp() {
    String enteredOtp = getOtpValue();
    print("Entered OTP from OtpController: $enteredOtp");
    if (enteredOtp.isEmpty || enteredOtp.length < fields) {
      Get.closeAllSnackbars();
      Get.snackbar(
        'System',
        'กรุณากรอกข้อมูลให้ครบถ้วน',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
     
      );
    } else if (enteredOtp != otp) {
      Get.closeAllSnackbars();
      Get.snackbar(
        'System',
        'รหัสผ่านไม่ถูกต้อง',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      
      );
      return;
    }
    // else {
    //   Get.closeAllSnackbars();
    //   Get.snackbar(
    //     'System',
    //     'OTP ถูกต้อง',
    //     snackPosition: SnackPosition.TOP,
    //     colorText: Colors.white,
    //     backgroundColor: Colors.green,
    //   );
    clearOtpFields();
    if (Get.context != null) {
      FocusScope.of(Get.context!).unfocus();
     Get.to(() => ResetpassUi());
    }
  }
}
