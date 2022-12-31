import 'package:get/get.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/data/services/recipe_api_service.dart';
import 'package:recipe_app/data/services/saved_recipes_service.dart';

class DetailsController extends GetxController {
  final RecipeApiService apiService;
  final SavedRecipesService savedService;
  final Recipe? recipeArg;
  final RecipeSearchItem? searchItemArg;

  Rx<Recipe?> recipe = Rx(null);
  var loading = false.obs;
  var error = "".obs;

  DetailsController({
    required this.apiService,
    required this.savedService,
    required this.recipeArg,
    required this.searchItemArg,
  });

  @override
  void onInit() async {
    if (recipeArg == null) {
      loading.value = true;
      error.value = "";
      try {
        var res = await apiService.getRecipeById(searchItemArg!.id);
        recipe.value = res;
      } catch (e) {
        error.value = "$e";
      } finally {
        loading.value = false;
      }
    } else {
      recipe = recipeArg!.obs;
    }
    super.onInit();
  }
}
