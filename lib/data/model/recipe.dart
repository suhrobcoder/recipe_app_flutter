import 'package:json_annotation/json_annotation.dart';

import 'instruction.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  final int id;
  final String title;
  final String summary;
  final String? image;
  final bool vegetarian;
  final int? readyInMinutes;
  final String? instructions;
  final List<String> cuisines;
  final List<String> diets;
  final int servings;
  final List<Instruction> analyzedInstructions;

  Recipe({
    required this.id,
    required this.title,
    required this.summary,
    this.image,
    required this.vegetarian,
    this.readyInMinutes,
    this.instructions,
    required this.cuisines,
    required this.diets,
    required this.servings,
    required this.analyzedInstructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
