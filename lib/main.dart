import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/data/services/app_config_service.dart';
import 'package:recipe_app/data/services/app_settings_service.dart';
import 'package:recipe_app/data/services/recipe_api_service.dart';
import 'package:recipe_app/routes/pages.dart';

import 'data/services/saved_recipes_service.dart';
import 'routes/routes.dart';

void main() async {
  await GetStorage.init();
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  Get.put(RecipeApiService());
  Get.put(SavedRecipesService());
  Get.put(AppSettingsService());
  await Get.putAsync(() => AppConfigService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipe App',
      home: const Text("Hello World"),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Routes.onboarding,
    );
  }
}
