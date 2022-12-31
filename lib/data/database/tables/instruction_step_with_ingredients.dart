import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/instruction_step.dart';

class InstructionStepWithIngredients {
  final InstructionStep instructionStep;
  final List<Ingredient> ingredients;

  InstructionStepWithIngredients({
    required this.instructionStep,
    required this.ingredients,
  });
}
