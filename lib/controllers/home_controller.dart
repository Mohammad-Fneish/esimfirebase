import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observable variable to track the selected button index
  var selectedButtonIndex = 0.obs;

  // Method to update the selected button index
  void setSelectedButtonIndex(int index) {
    selectedButtonIndex.value = index;
  }
}
