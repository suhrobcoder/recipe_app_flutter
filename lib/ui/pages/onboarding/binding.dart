import 'package:get/get.dart';
import 'package:recipe_app/ui/pages/onboarding/controller.dart';

class OnboardingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController(Get.find()));
  }
}
