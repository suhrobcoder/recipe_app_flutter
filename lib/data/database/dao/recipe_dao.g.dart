// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_dao.dart';

// ignore_for_file: type=lint
mixin _$RecipeDaoMixin on DatabaseAccessor<SavedRecipesDatabase> {
  $RecipesTable get recipes => attachedDatabase.recipes;
  $EquipmentsTable get equipments => attachedDatabase.equipments;
  $IngredientsTable get ingredients => attachedDatabase.ingredients;
  $InstructionStepsTable get instructionSteps =>
      attachedDatabase.instructionSteps;
  $InstructionStepEquipmentRelationTable get instructionStepEquipmentRelation =>
      attachedDatabase.instructionStepEquipmentRelation;
  $InstructionStepIngredientRelationTable
      get instructionStepIngredientRelation =>
          attachedDatabase.instructionStepIngredientRelation;
}
