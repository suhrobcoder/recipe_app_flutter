import 'recipe_search_item.dart';

class RecipeSearchResponse {
  final List<RecipeSearchItem> results;
  final int offset;
  final int number;
  final int totalResults;

  RecipeSearchResponse(
      this.results, this.offset, this.number, this.totalResults);

  RecipeSearchResponse.fromJson(Map<String, dynamic> json)
      : results = (json["results"] as List)
            .map((e) => RecipeSearchItem.fromJson(e))
            .toList(),
        offset = json["offset"],
        number = json["number"],
        totalResults = json["totalResults"];
}
