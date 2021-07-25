import 'package:get/get.dart';
import 'package:recipe_app/pages/home/controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
