import 'package:drift/drift.dart';
import 'package:recipe_app/data/database/tables/ingredients.dart';
import 'package:recipe_app/data/database/tables/instruction_steps.dart';

class InstructionStepIngredientRelation extends Table {
  IntColumn get instructionStepId =>
      integer().references(InstructionSteps, #id)();
  IntColumn get ingredientId => integer().references(Ingredients, #id)();
}
