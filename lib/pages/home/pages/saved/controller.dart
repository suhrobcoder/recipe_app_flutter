import 'package:get/get.dart';
import 'package:recipe_app/data/database/saved_recipes.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/services/saved_recipes_service.dart';
import 'package:recipe_app/routes/routes.dart';

class SavedPageController extends GetxController {
  final SavedRecipesService savedRecipesService;

  SavedPageController({required this.savedRecipesService}) {
    SavedRecipes.instance.onChange = () => refreshRecipes();
  }

  var savedRecipes = <Recipe>[].obs;

  @override
  void onInit() {
    refreshRecipes();
    super.onInit();
  }

  void refreshRecipes() async {
    savedRecipes.value = await savedRecipesService.getAllRecipes();
  }

  void clickRecipe(int recipeId) {
    Recipe recipe =
        savedRecipes.where((element) => element.id == recipeId).first;
    Get.toNamed(Routes.details, arguments: recipe);
  }
}
