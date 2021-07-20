import 'package:dio/dio.dart';
import 'package:recipe_app/data/model/random_recipes_response.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/data/model/recipe_search_response.dart';

import 'auth_interceptors.dart';

class RecipeApi {
  static String baseUrl = "https://api.spoonacular.com/";

  late final Dio _dio;

  RecipeApi() {
    _dio = Dio();
    _dio.interceptors.add(AuthInterceptors());
    _dio.interceptors.add(LogInterceptor());
    _dio.options.baseUrl = baseUrl;
  }

  Future<Recipe> getRecipeById(int id) async {
    Response response = await _dio.get("recipes/$id/information");
    return Recipe.fromJson(response.data);
  }

  Future<RecipeSearchResponse> searchRecipes(
    String query,
    List<String> cuisine,
    String diet,
    intelorances,
    String type,
    List<String> includeIngredients,
    int maxReadyTime,
    String sort,
    String sortDirection,
    int number,
    int offset,
  ) async {
    Map<String, dynamic> parameters = {
      "query": query,
      "cuisine": cuisine.join(", "),
      "diet": diet,
      "intelorances": intelorances,
      "type": type,
      "includeIngredients": includeIngredients.join(", "),
      "maxReadyTime": maxReadyTime,
      "sort": sort,
      "sortDirection": sortDirection,
      "number": number,
      "offset": offset,
    };
    Response response = await _dio.get(
      "recipes/complexSearch",
      queryParameters: parameters,
    );
    return RecipeSearchResponse.fromJson(response.data);
  }

  Future<RandomRecipesResponse> getRandomRecipes(
    int number,
    List<String> tags,
    int offset,
  ) async {
    Map<String, dynamic> parameters = {
      "number": number,
      "tags": tags.join(", "),
      "offset": offset,
    };
    Response response = await _dio.get(
      "recipes/random",
      queryParameters: parameters,
    );
    return RandomRecipesResponse.fromJson(response.data);
  }

  Future<List<RecipeSearchItem>> autoCompleteSearch(
    String query,
    int number,
  ) async {
    Map<String, dynamic> parameters = {
      "query": query,
      "number": number,
    };
    Response response = await _dio.get(
      "recipes/autocomplete",
      queryParameters: parameters,
    );
    return (response.data as List)
        .map((json) => RecipeSearchItem.fromJson(json))
        .toList();
  }
}
