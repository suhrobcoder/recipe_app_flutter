import 'recipe.dart';

class RandomRecipesResponse {
  final List<Recipe> recipes;

  RandomRecipesResponse(this.recipes);

  RandomRecipesResponse.fromJson(Map<String, dynamic> json)
      : recipes =
            (json["recipes"] as List).map((e) => Recipe.fromJson(e)).toList();
}
