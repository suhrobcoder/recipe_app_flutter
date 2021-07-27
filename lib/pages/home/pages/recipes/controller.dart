import 'package:get/get.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/services/recipe_api_service.dart';

class RecipesPageController extends GetxController {
  final RecipeApiService _apiService;

  RecipesPageController(this._apiService);

  var randomRecipes = <Recipe>[].obs;

  var loading = false.obs;
  var error = "".obs;

  loadRandomRecipes() async {
    loading.value = true;
    error.value = "";
    try {
      var res = await _apiService.getRandomRecipes([]);
      randomRecipes.value = res.recipes;
    } catch (err) {
      error.value = err.toString();
    } finally {
      loading.value = false;
    }
  }

  onClickRecipe(Recipe recipe) {}
}
