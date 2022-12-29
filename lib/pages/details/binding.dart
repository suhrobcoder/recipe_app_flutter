import 'package:get/get.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/data/services/recipe_api_service.dart';
import 'package:recipe_app/data/services/saved_recipes_service.dart';
import 'package:recipe_app/pages/details/controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController(
          apiService: Get.find<RecipeApiService>(),
          savedService: Get.find<SavedRecipesService>(),
          recipeArg: (Get.arguments is Recipe) ? Get.arguments : null,
          searchItemArg: (Get.arguments is RecipeSearchItem) ? Get.arguments : null,
        ));
  }
}
