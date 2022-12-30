import 'package:json_annotation/json_annotation.dart';

import 'recipe_search_item.dart';

part 'recipe_search_response.g.dart';

@JsonSerializable()
class RecipeSearchResponse {
  final List<RecipeSearchItem> results;
  final int offset;
  final int number;
  final int totalResults;

  RecipeSearchResponse({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  factory RecipeSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeSearchResponseToJson(this);
}
