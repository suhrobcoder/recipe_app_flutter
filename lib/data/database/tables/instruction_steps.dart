import 'package:drift/drift.dart';

@DataClassName("InstructionStepTable")
class InstructionSteps extends Table {
  IntColumn get id => integer()();
  IntColumn get recipeId => integer()();
  IntColumn get number => integer()();
  TextColumn get step => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
