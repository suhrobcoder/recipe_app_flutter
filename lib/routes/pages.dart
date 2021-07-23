import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.onboarding, page: () => Text("Onboarding")),
  ];
}
