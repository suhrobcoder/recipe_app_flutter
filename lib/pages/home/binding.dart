import 'package:get/get.dart';
import 'package:recipe_app/data/services/recipe_api_service.dart';
import 'package:recipe_app/pages/home/controller.dart';
import 'package:recipe_app/pages/home/pages/recipes/controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => RecipesPageController(Get.find<RecipeApiService>())..loadRandomRecipes());
  }
}
