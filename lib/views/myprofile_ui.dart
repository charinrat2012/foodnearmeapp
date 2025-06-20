import 'package:flutter/material.dart';

import 'package:food_near_me_app/views/navbar.dart';
import 'package:get/get.dart';

import '../controllers/scrollctrl.dart';
import '../widgets/matwid/back_bt.dart';
import '../widgets/matwid/scrolltotop_bt.dart';



// ตรวจสอบว่าไฟล์นี้มีอยู่จริง

class MyprofileUi extends StatelessWidget {
  const MyprofileUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // หาความสูงของ AppBar และ Status bar สำหรับการคำนวณตำแหน่ง
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double profileCircleSize = 100.0; // ขนาดของวงกลมรูปโปรไฟล์

    // Note: If ScrollpageController is not truly needed for this specific UI,
    // you might consider removing Get.find() if it causes issues or is unused.
    final ScrollpageController scrollpageController = Get.find<ScrollpageController>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // ซ่อนคีย์บอร์ดเมื่อแตะที่อื่น
      },
      child: Scaffold(
        // backgroundColor: Colors.pink[200],
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: const Align(alignment: Alignment.centerLeft, child: BackBt()),
          toolbarHeight: 8 * 10,
          automaticallyImplyLeading: false,
          actions: [
            Image.asset(
              "assets/imgs/logoHome.png",
              height: 8 * 10,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
          ],

          flexibleSpace: Container(
            // ใช้ flexibleSpace เพื่อใส่ Gradient
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink[200]!, // สีชมพูอ่อน
                  Colors.blue[200]!, // สีชมพูอ่อน
                ],
                begin: Alignment.centerLeft,
                transform: GradientRotation(3.0),
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            // Container หลักที่ทำหน้าที่เป็นพื้นหลังสีขาวโค้งมน
            Container(
              decoration: BoxDecoration(
                      
                   
                     gradient: LinearGradient(
                  colors: [
                    Colors.pink[200]!, // สีชมพูอ่อน
                    Colors.blue[200]!, // สีชมพูอ่อน
                  ],
                  begin: Alignment.centerLeft,
                  transform: GradientRotation(3.0),
                  end: Alignment.centerRight,
                ), ),
              child: Column( // ใช้ Column เพื่อจัดการส่วนบนสีชมพูและส่วนล่างสีขาว
                children: [
                  // พื้นที่สีชมพูด้านบน
                  Container(
                    height: 50.0, // ปรับความสูงนี้เพื่อกำหนดว่าส่วนสีขาวจะเริ่มที่ไหน
                    decoration: BoxDecoration(
                      
                   
                     gradient: LinearGradient(
                  colors: [
                    Colors.pink[200]!, // สีชมพูอ่อน
                    Colors.blue[200]!, // สีชมพูอ่อน
                  ],
                  begin: Alignment.centerLeft,
                  transform: GradientRotation(3.0),
                  end: Alignment.centerRight,
                ), ),
                  ),
                  // พื้นที่สีขาวโค้งมน
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // ชื่อผู้ใช้ (ไก่)
                            Expanded(child: SizedBox()),
                            Text(
                              'ไก่',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 10), // ระยะห่างระหว่างชื่อกับฟอร์ม
                                    
                            // ฟอร์มข้อมูลส่วนตัว
                            _buildTextFieldWithLabel('ชื่อเล่น', 'ไก่', false),
                            _buildTextFieldWithLabel('เบอร์โทรศัพท์', '0894563258', false),
                            _buildTextFieldWithLabel('อีเมล', 'Chicken1123@gmail.com', false),
                            _buildTextFieldWithLabel('รหัสผ่าน', '********', true), // isObscureText: true
                                    
                            SizedBox(height: 30), // ระยะห่างก่อนปุ่ม
                                    
                            // ปุ่ม "แก้ไขข้อมูล"
                            SizedBox(
                              width: double.infinity, // ทำให้ปุ่มเต็มความกว้าง
                              child: ElevatedButton(
                                onPressed: () {
                                  // Logic สำหรับแก้ไขข้อมูล
                                  print('แก้ไขข้อมูล');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink[400], // สีปุ่มตามตัวอย่าง
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text(
                                  'แก้ไขข้อมูล',
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 15), // ระยะห่างระหว่างปุ่ม
                                    
                            // ปุ่ม "ออกจากระบบ"
                            TextButton(
                              onPressed: () {
                                Get.offAll(() => Navbar());
                                // Logic สำหรับออกจากระบบ
                                print('ออกจากระบบ');
                                // Get.offAll(() => LoginPage()); // ตัวอย่างการไปหน้า Login
                              },
                              child: Text(
                                'ออกจากระบบ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  decoration: TextDecoration.underline, // ขีดเส้นใต้
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // วงกลมใส่รูปโปรไฟล์ (Positioned เป็นลูกโดยตรงของ Stack)
            Positioned(
              left: 0,
              right: 0,
              // วางตำแหน่งของวงกลมให้อยู่กึ่งกลางแนวนอน และลอยอยู่ระหว่างส่วนสีชมพูและส่วนสีขาว
              top: statusBarHeight + appBarHeight - (profileCircleSize / 1.2),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: profileCircleSize,
                  height: profileCircleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // พื้นหลังวงกลมสีขาว
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/imgs/pofile.jpg", // **เปลี่ยนเป็น path รูปโปรไฟล์ของคุณ**
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // ปุ่ม ScrollToTopButton (ยังคงเป็นลูกโดยตรงของ Stack)
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
    );
  }

  // Helper method เพื่อสร้าง TextField พร้อม Label
  Widget _buildTextFieldWithLabel(String label, String hint, bool isObscure) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // ขอบโค้งมนเล็กน้อย
                borderSide: BorderSide.none, // ไม่มีเส้นขอบ
              ),
              filled: true,
              fillColor: Colors.grey[100], // พื้นหลัง TextField สีเทาอ่อน
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
            obscureText: isObscure, // สำหรับรหัสผ่าน
            readOnly: true, // ทำให้ TextField ไม่สามารถแก้ไขได้
            // หากต้องการให้แก้ไขได้ ให้ลบ readOnly ออก หรือเพิ่ม controller
          ),
        ],
      ),
    );
  }
}