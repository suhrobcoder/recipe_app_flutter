import 'package:get/get.dart';
import 'package:recipe_app/data/api/recipe_api.dart';
import 'package:recipe_app/data/model/random_recipes_response.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/data/model/recipe_search_response.dart';

const _recipesPageSize = 20;
const _autoCompleteSize = 10;
const _defaultPage = 1;

class RecipeApiService extends GetxService {
  final RecipeApi api = RecipeApi();

  Future<Recipe> getRecipeById(int id) async {
    return api.getRecipeById(id);
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
      {int page = _defaultPage}) async {
    return api.searchRecipes(
      query,
      cuisine,
      diet,
      intelorances,
      type,
      includeIngredients,
      maxReadyTime,
      sort,
      sortDirection,
      _recipesPageSize,
      (page - 1) * _recipesPageSize,
    );
  }

  Future<RandomRecipesResponse> getRandomRecipes(List<String> tags,
      {int page = 1}) async {
    return api.getRandomRecipes(
        _recipesPageSize, tags, (page - 1) * _recipesPageSize);
  }

  Future<List<RecipeSearchItem>> autoCompleteSearch(String query) async {
    return api.autoCompleteSearch(query, _autoCompleteSize);
  }
}

const cuisines = [
  "African",
  "American",
  "British",
  "Chinese",
  "Eastern European",
  "European",
  "French",
  "Indian",
  "Italian",
  "Japanese",
  "Korean",
  "Latin American",
  "Mexican",
  "Middle Eastern",
  "Thai",
  "Vietnamese",
];

const diets = [
  "Gluten Free",
  "Ketogenic",
  "Vegetarian",
  "Lacto-Vegetarian",
  "Ovo-Vegetarian",
  "Vegan",
  "Pescetarian",
  "Paleo",
  "Primal",
];

const mealTypes = [
  "main course",
  "side dish",
  "dessert",
  "appetizer",
  "salad",
  "bread",
  "breakfast",
  "soup",
  "beverage",
  "sauce",
  "marinade",
  "fingerfood",
  "snack",
  "drink",
];

const sortTypes = [
  "popularity",
  "price",
  "time",
  "calories",
  "sugar",
  "protein",
];
