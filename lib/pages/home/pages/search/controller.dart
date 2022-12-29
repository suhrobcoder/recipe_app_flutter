import 'package:get/get.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/data/services/recipe_api_service.dart';
import 'package:recipe_app/routes/routes.dart';

class SearchPageController extends GetxController {
  final RecipeApiService service;

  var mealType = "".obs;
  var diet = "".obs;
  var cookTime = 0.obs;

  var searchResults = <RecipeSearchItem>[].obs;
  var loading = false.obs;
  var error = "".obs;

  SearchPageController(this.service);

  void selectMealType(String type) {
    if (mealType.value == type) {
      mealType.value = "";
    } else {
      mealType.value = type;
    }
  }

  void selectDiet(String _diet) {
    if (diet.value == _diet) {
      diet.value = "";
    } else {
      diet.value = _diet;
    }
  }

  void setCookTime(double time) {
    cookTime.value = time.ceil();
  }

  void clearAll() {
    mealType.value = "";
    diet.value = "";
    cookTime.value = 0;
  }

  void search(String query) async {
    print("Searching");
    loading.value = true;
    error.value = "";
    try {
      var res = await service.searchRecipes(query, [], diet.value, [],
          mealType.value, [], cookTime.value, "", "");
      searchResults.value = res.results;
      print(res.results.map((e) => e.title).toList().join(":"));
    } catch (_error) {
      print("Error: $_error");
      error.value = "$_error";
    } finally {
      loading.value = false;
      print("Finished");
    }
  }

  void recipeClick(RecipeSearchItem recipe) {
    Get.toNamed(Routes.details, arguments: recipe);
  }
}
