import 'package:get/get.dart';
import 'package:recipe_app/pages/home/binding.dart';
import 'package:recipe_app/pages/home/page.dart';
import 'package:recipe_app/pages/onboarding/binding.dart';
import 'package:recipe_app/pages/onboarding/page.dart';

import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.onboarding,
      page: () => OnboardingPage(),
      binding: OnboardingPageBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
  ];
}
