// lib/widgets/homewid/LocationFilterBar.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/filterctrl.dart';
import 'localist.dart';

class LocationFilterBar extends StatelessWidget {
  const LocationFilterBar({super.key});

 
 

  @override
  Widget build(BuildContext context) {
    final FilterController filterController = Get.find<FilterController>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      Obx(() => _buildProvinceDropdown(filterController)),
      const SizedBox(width: 8),
      Obx(() => _buildDistrictDropdown(filterController)),
      const SizedBox(width: 8),
       _buildLocationButton(),

      
    ],
  ),
),
  const SizedBox(height: 8),

SizedBox(width: double.infinity, child: Obx(() => _buildCategoryDropdown(filterController))),
        ],
      ),
    );
  }

  Widget _buildProvinceDropdown(FilterController filterController) {
    return _buildContainer(
      SizedBox(
        width: 130,
        child: DropdownButton<String>(
          isExpanded: true,
          value: filterController.selectedProvince.value.isEmpty
              ? null
              : filterController.selectedProvince.value,
          hint: const Text('เลือกจังหวัด', style: TextStyle(color: Colors.white)),
         
          dropdownColor: Colors.purple[200],
          iconEnabledColor: Colors.white,
          menuMaxHeight: 400,
        menuWidth: 200,
          style: const TextStyle(color: Colors.white),
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('ทั้งหมด', style: TextStyle(color: Colors.white)),
            ),
           
            ...Localist.provinces.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.white)),
              );
            }).toList(),
          ],
          onChanged: (newValue) {
            filterController.setSelectedProvince(newValue ?? '');
          },
        ),
      ),
    );
  }

  Widget _buildDistrictDropdown(FilterController filterController) {
   
    final List<String> districts = Localist.districtsByProvince[filterController.selectedProvince.value] ?? [];
    return _buildContainer(
      SizedBox(
        width: 143,
        child: DropdownButton<String>(
          isExpanded: true,
          value: filterController.selectedDistrict.value.isEmpty
              ? null
              : filterController.selectedDistrict.value,
          hint: const Text('เลือกเขต/อำเภอ', style: TextStyle(color: Colors.white)),
          dropdownColor: Colors.purple[200],
          iconEnabledColor: Colors.white,
          menuMaxHeight: 400,
        menuWidth: 200,
          style: const TextStyle(color: Colors.white),
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('ทั้งหมด', style: TextStyle(color: Colors.white)),
            ),
            ...districts.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.white)),
              );
            }).toList(),
          ],
          onChanged: (newValue) {
            filterController.setSelectedDistrict(newValue ?? '');
          },
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown(FilterController filterController) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
       
        gradient: LinearGradient(colors: [Colors.pink[300]!, Colors.blue[300]!]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: filterController.selectedCategory.value.isEmpty
            ? null
            : filterController.selectedCategory.value,
        hint: const Text('ตัวกรองประเภทอาหาร', style: TextStyle(color: Colors.white)),
        dropdownColor: Colors.purple[200],
        style: const TextStyle(color: Colors.white),
        iconEnabledColor: Colors.white,
        menuMaxHeight: 400,
        menuWidth: 200,
       
        items: [
          const DropdownMenuItem<String>(
            value: '',
            child: Text('ทั้งหมด', style: TextStyle(color: Colors.white)),
          ),
         
          ...Localist.foodTypes.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
        ],
        onChanged: (newValue) {
          filterController.setSelectedCategory(newValue ?? '');
        },
      ),
    );
  }

 
  Widget _buildLocationButton() {
    const double iconSize = 20.0;
    const double buttonPadding = 8.0;

    return Container(
      height: iconSize + buttonPadding * 2,
      width: iconSize + buttonPadding * 2, 
      decoration: BoxDecoration(
       
        gradient: LinearGradient(colors: [Colors.pink[300]!, Colors.blue[300]!]),
        borderRadius: BorderRadius.circular((iconSize + buttonPadding * 2) / 2),
      ),
      child: IconButton(
        iconSize: iconSize,
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        onPressed: () {
          Get.snackbar(
            'ตำแหน่งปัจจุบัน',
            'ฟังก์ชันนี้ยังไม่ได้ถูกพัฒนา',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.blueAccent,
            colorText: Colors.white,
          );
        },
        icon: const Icon(Icons.my_location, color: Colors.white),
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
       
        gradient: LinearGradient(colors: [Colors.pink[300]!, Colors.blue[300]!]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}