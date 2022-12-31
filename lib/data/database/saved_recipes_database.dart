import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:recipe_app/data/database/string_list_converter.dart';
import 'package:recipe_app/data/database/tables/equipments.dart';
import 'package:recipe_app/data/database/tables/ingredients.dart';
import 'package:recipe_app/data/database/tables/instruction_step_equipment_relation.dart';
import 'package:recipe_app/data/database/tables/instruction_step_ingredient_relation.dart';
import 'package:recipe_app/data/database/tables/instruction_steps.dart';
import 'package:recipe_app/data/database/tables/recipes.dart';

part 'saved_recipes_database.g.dart';

const _dbVersion = 1;
const _dbName = 'saved_recipes.db';

@singleton
@DriftDatabase(tables: [
  Recipes,
  Equipments,
  Ingredients,
  InstructionSteps,
  InstructionStepEquipmentRelation,
  InstructionStepIngredientRelation,
])
class SavedRecipesDatabase extends _$SavedRecipesDatabase {
  @factoryMethod
  SavedRecipesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => _dbVersion;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, _dbName));
    return NativeDatabase.createInBackground(file);
  });
}
