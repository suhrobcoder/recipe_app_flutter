import 'package:get/get.dart';

class HomePageController extends GetxController {
  var selectedTab = 0.obs;

  void selectTab(int index) {
    selectedTab.value = index;
  }
}
