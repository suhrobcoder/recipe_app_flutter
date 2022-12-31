import 'package:drift/drift.dart';

@DataClassName("EquipmentTable")
class Equipments extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get image => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
