import 'package:json_annotation/json_annotation.dart';

import 'equipment.dart';
import 'ingredient.dart';

part 'instruction_step.g.dart';

@JsonSerializable()
class InstructionStep {
  final int number;
  final String step;
  final List<Ingredient> ingredients;
  final List<Equipment> equipments;

  InstructionStep({
    required this.number,
    required this.step,
    required this.ingredients,
    required this.equipments,
  });

  factory InstructionStep.fromJson(Map<String, dynamic> json) =>
      _$InstructionStepFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionStepToJson(this);

  int getId(int recipeId) {
    return recipeId * 100 + number;
  }
}
