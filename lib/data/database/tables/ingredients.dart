import 'package:drift/drift.dart';

@DataClassName("IngredientTable")
class Ingredients extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get image => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
