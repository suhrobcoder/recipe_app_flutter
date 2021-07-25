import 'package:get/get.dart';
import 'package:recipe_app/pages/onboarding/controller.dart';

class OnboardingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController(Get.find()));
  }
}
