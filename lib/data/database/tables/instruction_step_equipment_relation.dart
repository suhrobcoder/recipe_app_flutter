import 'package:drift/drift.dart';
import 'package:recipe_app/data/database/tables/equipments.dart';
import 'package:recipe_app/data/database/tables/instruction_steps.dart';

class InstructionStepEquipmentRelation extends Table {
  IntColumn get instructionStepId =>
      integer().references(InstructionSteps, #id)();
  IntColumn get equipmentId => integer().references(Equipments, #id)();
}
