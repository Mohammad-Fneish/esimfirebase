import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Reactive index for the current tab
  var currentIndex = 0.obs;

  // Method to update the current index
  void setIndex(int index) {
    currentIndex.value = index;
  }
}
