import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/model/random_recipes_response.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/data/model/recipe_search_response.dart';
import 'package:retrofit/retrofit.dart';

part 'recipe_api.g.dart';

@singleton
@RestApi(baseUrl: 'https://api.spoonacular.com')
abstract class RecipeApi {
  @factoryMethod
  factory RecipeApi(Dio dio) = _RecipeApi;

  @GET('recipes/{id}/information')
  Future<Recipe> getRecipeById(
    @Path('id') int id,
  );

  @GET('recipes/complexSearch')
  Future<RecipeSearchResponse> searchRecipes({
    @Query('query') required String query,
    @Query('number') required int number,
    @Query('offset') required int offset,
    @Query('cuisine') List<String>? cuisine,
    @Query('diet') String? diet,
    @Query('intelorances') List<String>? intelorances,
    @Query('type') String? type,
    @Query('includeIngredients') List<String>? includeIngredients,
    @Query('maxReadyTime') int? maxReadyTime,
    @Query('sort') String? sort,
    @Query('sortDirection') String? sortDirection,
  });

  @GET('recipes/random')
  Future<RandomRecipesResponse> getRandomRecipes({
    @Query('number') required int number,
    @Query('tags') List<String>? tags,
    @Query('offset') int offset = 0,
  });

  @GET('recipes/autocomplete')
  Future<List<RecipeSearchItem>> autoCompleteSearch({
    @Query('query') required String query,
    @Query('number') required int number,
  });
}
