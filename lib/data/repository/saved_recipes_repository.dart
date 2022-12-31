import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/database/dao/recipe_dao.dart';
import 'package:recipe_app/data/model/recipe.dart';

@injectable
class SavedRecipesRepository {
  final RecipeDao recipeDao;

  const SavedRecipesRepository(this.recipeDao);

  Future<void> insertRecipe(Recipe recipe) async {
    await recipeDao.insertRecipe(recipe);
  }

  Future<void> removeRecipe(Recipe recipe) async {
    await recipeDao.removeRecipe(recipe);
  }

  Stream<List<Recipe>> getAllRecipes() {
    return recipeDao.watchRecipes();
  }

  Future<Recipe?> getRecipeById(int id) async {
    return await recipeDao.getRecipeById(id);
  }
}
