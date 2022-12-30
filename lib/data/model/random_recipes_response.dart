import 'package:json_annotation/json_annotation.dart';

import 'recipe.dart';

part 'random_recipes_response.g.dart';

@JsonSerializable()
class RandomRecipesResponse {
  final List<Recipe> recipes;

  RandomRecipesResponse({
    required this.recipes,
  });

  factory RandomRecipesResponse.fromJson(Map<String, dynamic> json) =>
      _$RandomRecipesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RandomRecipesResponseToJson(this);
}
