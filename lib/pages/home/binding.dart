import 'package:get/get.dart';
import 'package:recipe_app/data/services/app_config_service.dart';
import 'package:recipe_app/data/services/recipe_api_service.dart';
import 'package:recipe_app/pages/home/controller.dart';
import 'package:recipe_app/pages/home/pages/recipes/controller.dart';
import 'package:recipe_app/pages/home/pages/search/controller.dart';
import 'package:recipe_app/pages/home/pages/settings/controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => RecipesPageController(Get.find<RecipeApiService>())
      ..loadRandomRecipes());
    Get.lazyPut(() => SearchPageController(Get.find<RecipeApiService>()));
    Get.lazyPut(() => SettingsPageController(
          configService: Get.find<AppConfigService>(),
        ));
  }
}
