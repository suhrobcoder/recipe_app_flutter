import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/model/random_recipes_response.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/data/model/recipe_search_response.dart';
import 'package:recipe_app/util/error/failures.dart';
import 'package:recipe_app/data/api/recipe_api.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/util/error/safe_network_call.dart';

const _recipesPageSize = 20;
const _autoCompleteSize = 10;
const _defaultPage = 1;

@injectable
class RecipeRepository {
  final RecipeApi recipeApi;

  const RecipeRepository(this.recipeApi);

  Future<Either<Recipe, Failure>> getRecipeById({
    required int id,
  }) async {
    return safeNetworkCall(() => recipeApi.getRecipeById(id));
  }

  Future<Either<RecipeSearchResponse, Failure>> searchRecipes({
    required String query,
    int page = _defaultPage,
    List<String>? cuisine,
    String? diet,
    List<String>? intelorances,
    String? type,
    List<String>? includeIngredients,
    int? maxReadyTime,
    String? sort,
    String? sortDirection,
  }) async {
    return safeNetworkCall(() => recipeApi.searchRecipes(
          query: query,
          number: _recipesPageSize,
          offset: (page - 1) * _recipesPageSize,
          cuisine: cuisine,
          diet: diet,
          intelorances: intelorances,
          type: type,
          includeIngredients: includeIngredients,
          maxReadyTime: maxReadyTime,
          sort: sort,
          sortDirection: sortDirection,
        ));
  }

  Future<Either<RandomRecipesResponse, Failure>> getRandomRecipes({
    List<String>? tags,
    int page = _defaultPage,
  }) async {
    return safeNetworkCall(() => recipeApi.getRandomRecipes(
          number: _recipesPageSize,
          tags: tags,
          offset: (page - 1) * _recipesPageSize,
        ));
  }

  Future<Either<List<RecipeSearchItem>, Failure>> autoCompleteSearch({
    required String query,
  }) async {
    return safeNetworkCall(() => recipeApi.autoCompleteSearch(
          query: query,
          number: _autoCompleteSize,
        ));
  }
}
