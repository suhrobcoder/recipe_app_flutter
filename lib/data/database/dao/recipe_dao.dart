import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/database/saved_recipes_database.dart';
import 'package:recipe_app/data/database/tables/equipments.dart';
import 'package:recipe_app/data/database/tables/ingredients.dart';
import 'package:recipe_app/data/database/tables/instruction_step_equipment_relation.dart';
import 'package:recipe_app/data/database/tables/instruction_step_ingredient_relation.dart';
import 'package:recipe_app/data/database/tables/instruction_steps.dart';
import 'package:recipe_app/data/database/tables/recipes.dart';
import 'package:recipe_app/data/model/equipment.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/instruction.dart';
import 'package:recipe_app/data/model/instruction_step.dart';
import 'package:recipe_app/data/model/recipe.dart';

part 'recipe_dao.g.dart';

@injectable
@DriftAccessor(tables: [
  Recipes,
  Equipments,
  Ingredients,
  InstructionSteps,
  InstructionStepEquipmentRelation,
  InstructionStepIngredientRelation
])
class RecipeDao extends DatabaseAccessor<SavedRecipesDatabase>
    with _$RecipeDaoMixin {
  @factoryMethod
  RecipeDao(SavedRecipesDatabase db) : super(db);

  Future<void> insertRecipe(Recipe recipe) {
    return transaction(() async {
      await into(recipes).insert(RecipesCompanion.insert(
          id: Value(recipe.id),
          title: recipe.title,
          summary: recipe.summary,
          vegetarian: recipe.vegetarian,
          cuisines: recipe.cuisines,
          diets: recipe.diets,
          servings: recipe.servings));
      for (var step in recipe.analyzedInstructions[0].steps) {
        await into(instructionSteps).insert(InstructionStepsCompanion.insert(
            id: Value(step.getId(recipe.id)),
            recipeId: recipe.id,
            number: step.number,
            step: step.step));
        for (var equipment in step.equipments) {
          await into(equipments).insert(EquipmentsCompanion.insert(
              id: Value(equipment.id),
              name: equipment.name,
              image: Value(equipment.image)));
          await into(instructionStepEquipmentRelation).insert(
              InstructionStepEquipmentRelationCompanion.insert(
                  instructionStepId: step.getId(recipe.id),
                  equipmentId: equipment.id));
        }
        for (var ingredient in step.ingredients) {
          await into(ingredients).insert(IngredientsCompanion.insert(
              id: Value(ingredient.id),
              name: ingredient.name,
              image: Value(ingredient.image)));
          await into(instructionStepIngredientRelation).insert(
              InstructionStepIngredientRelationCompanion.insert(
                  instructionStepId: step.getId(recipe.id),
                  ingredientId: ingredient.id));
        }
      }
    });
  }

  Future<void> removeRecipe(Recipe recipe) {
    return transaction(() async {
      await (delete(recipes)..where((tbl) => tbl.id.equals(recipe.id))).go();
      // Clear other tables
    });
  }

  Stream<List<Recipe>> watchRecipes() {
    return select(recipes).watch().map((recipes) => recipes
        .map((recipe) => Recipe(
            id: recipe.id,
            title: recipe.title,
            summary: recipe.summary,
            vegetarian: recipe.vegetarian,
            cuisines: recipe.cuisines,
            diets: recipe.diets,
            servings: recipe.servings,
            analyzedInstructions: const []))
        .toList());
  }

  Future<Recipe?> getRecipeById(int id) async {
    final recipe = await (select(recipes)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    if (recipe == null) {
      return null;
    }
    final instructions = await (select(instructionSteps)
          ..where((tbl) => tbl.recipeId.equals(id)))
        .get();
    final steps = await Future.wait(instructions.map((instruction) async {
      final ingredientList =
          await (select(instructionStepIngredientRelation).join([
        innerJoin(
          ingredients,
          ingredients.id
              .equalsExp(instructionStepIngredientRelation.ingredientId),
        ),
      ])
                ..where(instructionStepIngredientRelation.instructionStepId
                    .equals(instruction.id)))
              .get();
      final equipmentList =
          await (select(instructionStepEquipmentRelation).join([
        innerJoin(
          equipments,
          equipments.id.equalsExp(instructionStepEquipmentRelation.equipmentId),
        ),
      ])
                ..where(instructionStepEquipmentRelation.instructionStepId
                    .equals(instruction.id)))
              .get();
      return InstructionStep(
        number: instruction.number,
        step: instruction.step,
        ingredients: ingredientList.map((result) {
          final table = result.readTable(ingredients);
          return Ingredient(id: table.id, name: table.name, image: table.image);
        }).toList(),
        equipments: equipmentList.map((result) {
          final table = result.readTable(equipments);
          return Equipment(id: table.id, name: table.name, image: table.image);
        }).toList(),
      );
    }).toList());
    return Recipe(
        id: recipe.id,
        title: recipe.title,
        summary: recipe.summary,
        vegetarian: recipe.vegetarian,
        cuisines: recipe.cuisines,
        diets: recipe.diets,
        servings: recipe.servings,
        analyzedInstructions: [
          Instruction(
            name: '',
            steps: steps,
          ),
        ]);
  }
}
