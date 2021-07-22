import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/data/model/equipment.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/instruction.dart';
import 'package:recipe_app/data/model/instruction_step.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:sqflite/sqflite.dart';

const _dbName = "saved_recipe.db";
const _dbVersion = 1;

class SavedRecipes {
  SavedRecipes._privateConstructor();

  static final SavedRecipes instance = SavedRecipes._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory docsDir = await getApplicationDocumentsDirectory();
    String path = join(docsDir.path, _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE recipe(
        id INTEGER NOT NULL PRIMARY KEY,
        title TEXT NOT NULL,
        summary TEXT NOT NULL,
        image TEXT,
        vegetarian INTEGER NOT NULL,
        readyInMinutes INTEGER,
        instructions TEXT,
        cuisines TEXT NOT NULL,
        diets TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE instructionStep(
        id INTEGER NOT NULL PRIMARY KEY,
        recipeId INTEGER NOT NULL,
        number INTEGER NOT NULL,
        step TEXT NOT NULL,
        FOREIGN KEY(recipeId) REFERENCES recipe(id) ON DELETE CASCADE ON UPDATE NO ACTION
      )
    ''');
    await db.execute('''
      CREATE TABLE equipment(
        id INTEGER NOT NULL PRIMARY KEY,
        name TEXT NOT NULL,
        image TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE ingredient(
        id INTEGER NOT NULL PRIMARY KEY,
        name TEXT NOT NULL,
        image TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE instruction_equipment_relation(
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        instructionId INTEGER NOT NULL,
        equipmentId INTEGER NOT NULL,
        FOREIGN KEY(instructionId) REFERENCES instructionStep(id) ON DELETE CASCADE ON UPDATE NO ACTION,
        FOREIGN KEY(equipmentId) REFERENCES equipment(id) ON DELETE CASCADE ON UPDATE NO ACTION
      )
    ''');
    await db.execute('''
      CREATE TABLE instruction_ingredient_relation(
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        instructionId INTEGER NOT NULL,
        ingredientId INTEGER NOT NULL,
        FOREIGN KEY(instructionId) REFERENCES instructionStep(id) ON DELETE CASCADE ON UPDATE NO ACTION,
        FOREIGN KEY(ingredientId) REFERENCES ingredient(id) ON DELETE CASCADE ON UPDATE NO ACTION
      )
    ''');
  }

  Future insertRecipe(Recipe recipe) async {
    final db = await database;
    List<InstructionStep> steps = recipe.analyzedInstructions[0].steps;
    Batch batch = db.batch();
    for (var step in steps) {
      int instructionId = step.getId(recipe.id);
      insertInstructionStep(batch, step, recipe.id);
      insertEquipments(batch, step.equipments, instructionId);
      insertIngredients(batch, step.ingredients, instructionId);
    }
    batch.insert(
      "recipe",
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await batch.commit();
  }

  Future deleteRecipe(int id) async {
    final db = await database;
    await db.delete("recipe", where: "id = ?", whereArgs: [id]);
  }

  Future<List<Recipe>> getAllRecipes() async {
    final db = await database;
    var result = await db.query("recipe");
    return result.map((e) => Recipe.fromMap(e, [])).toList();
  }

  Future<Recipe?> getRecipeById(int id) async {
    final db = await database;
    var instructionResult = await db
        .query("instructionStep", where: "recipeId = ?", whereArgs: [id]);
    List<InstructionStep> instructions = [];
    for (var instructionRes in instructionResult) {
      var instructionStepId = instructionRes["id"] as int;
      instructions.add(InstructionStep.fromMap(
          instructionRes,
          await getIngredients(db, instructionStepId),
          await getEquipments(db, instructionStepId)));
    }
    var result = await db.query("recipe", where: "id = ?", whereArgs: [id]);
    return result.isEmpty
        ? null
        : Recipe.fromMap(result[0], [Instruction("", instructions)]);
  }

  insertInstructionStep(
    Batch batch,
    InstructionStep step,
    int recipeId,
  ) {
    batch.insert("instructionStep", step.toMap(recipeId),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  insertEquipments(Batch batch, List<Equipment> equipments, int instructionId) {
    for (var equipment in equipments) {
      batch.insert("equipment", equipment.toMap(),
          conflictAlgorithm: ConflictAlgorithm.ignore);
      batch.insert(
        "instruction_equipment_relation",
        {"instructionId": instructionId, "equipmentId": equipment.id},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  insertIngredients(
      Batch batch, List<Ingredient> ingredients, int instructionId) {
    for (var ingredient in ingredients) {
      batch.insert(
        "ingredient",
        ingredient.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      batch.insert(
        "instruction_ingredient_relation",
        {"instructionId": instructionId, "ingredientId": ingredient.id},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Equipment>> getEquipments(
      Database db, int instructionStepId) async {
    var instructionEquipmentRel = await db.query(
      "instruction_equipment_relation",
      where: "instructionId = ?",
      whereArgs: [instructionStepId],
    );
    List<Equipment> equipments = [];
    for (var instructionEquipmentRelItem in instructionEquipmentRel) {
      int equipmentId = instructionEquipmentRelItem["equipmentId"] as int;
      var equipmentRes = await db.query(
        "equipment",
        where: "id = ?",
        whereArgs: [equipmentId],
      );
      if (equipmentRes.isNotEmpty) {
        equipments.add(Equipment.fromMap(equipmentRes[0]));
      }
    }
    return equipments;
  }

  Future<List<Ingredient>> getIngredients(
      Database db, int instructionStepId) async {
    var instructionIngredientRel = await db.query(
        "instruction_ingredient_relation",
        where: "instructionId = ?",
        whereArgs: [instructionStepId]);
    List<Ingredient> ingredients = [];
    for (var instructionIngredientRelItem in instructionIngredientRel) {
      int ingredientId = instructionIngredientRelItem["ingredientId"] as int;
      var ingredientRes = await db
          .query("ingredient", where: "id = ?", whereArgs: [ingredientId],);
      if (ingredientRes.isNotEmpty) {
        ingredients.add(Ingredient.fromMap(ingredientRes[0]));
      }
    }
    return ingredients;
  }
}
