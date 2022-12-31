import 'package:drift/drift.dart';
import 'package:recipe_app/data/database/string_list_converter.dart';

@DataClassName("RecipeTable")
class Recipes extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get summary => text()();
  TextColumn get image => text().nullable()();
  BoolColumn get vegetarian => boolean()();
  IntColumn get readyInMinutes => integer().nullable()();
  TextColumn get instructions => text().nullable()();
  TextColumn get cuisines => text().map(const StringListConverter())();
  TextColumn get diets => text().map(const StringListConverter())();
  IntColumn get servings => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
