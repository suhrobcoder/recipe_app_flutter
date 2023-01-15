import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_app/data/model/equipment.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/instruction_step.dart';

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
  @JsonKey(ignore: true)
  late final List<Ingredient> allIngredients;
  @JsonKey(ignore: true)
  late final List<Equipment> allEquipments;

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
  }) {
    allIngredients = _getAllIngredients();
    allEquipments = _getAllEquipments();
  }

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  List<Ingredient> _getAllIngredients() {
    Set<Ingredient> allIngredients = {};
    for (Instruction instruction in analyzedInstructions) {
      for (InstructionStep step in instruction.steps) {
        allIngredients.addAll(step.ingredients);
      }
    }
    return allIngredients.toList();
  }

  List<Equipment> _getAllEquipments() {
    Set<Equipment> allEquipments = {};
    for (Instruction instruction in analyzedInstructions) {
      for (InstructionStep step in instruction.steps) {
        allEquipments.addAll(step.equipments);
      }
    }
    return allEquipments.toList();
  }
}
