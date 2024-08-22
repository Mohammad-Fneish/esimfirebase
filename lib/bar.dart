import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/bottom_nav_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final BottomNavController controller = Get.find<BottomNavController>();

  CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        width: 340,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Obx(() {
          // Get the current locale
          final isRTL = Get.locale?.languageCode == 'ar';

          return Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'store', 0),
                  _buildNavItem(Icons.sim_card, 'esims', 1),
                  _buildNavItem(Icons.person_2_rounded, 'profile', 2),
                ],
              ),
              Positioned(
                bottom: 0,
                // Adjust the position based on RTL or LTR layout
                left: isRTL
                    ? 340 - (373 / 3 * controller.currentIndex.value) - 41
                    : (373 / 3 * controller.currentIndex.value) + 50,
                child: Container(
                  width: 24,
                  height: 2,
                  color: const Color(0xFF4DD965),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String translationKey, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.setIndex(index),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 30,
                color: controller.currentIndex.value == index
                    ? const Color(0xFF4DD965)
                    : Colors.grey,
              ),
              Text(
                translationKey.tr,
                style: TextStyle(
                  color: controller.currentIndex.value == index
                      ? const Color(0xFF4DD965)
                      : Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
