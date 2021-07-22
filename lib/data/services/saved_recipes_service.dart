import 'package:get/get.dart';
import 'package:recipe_app/data/database/saved_recipes.dart';
import 'package:recipe_app/data/model/recipe.dart';

class SavedRecipesService extends GetxService {
  final SavedRecipes _savedRecipes = SavedRecipes.instance;

  Future insertRecipe(Recipe recipe) async {
    await _savedRecipes.insertRecipe(recipe);
  }

  Future deleteRecipe(int id) async {
    await _savedRecipes.deleteRecipe(id);
  }

  Future<List<Recipe>> getAllRecipes() async {
    return await _savedRecipes.getAllRecipes();
  }

  Future<Recipe?> getRecipeById(int id) async {
    return await _savedRecipes.getRecipeById(id);
  }
}
