import 'package:recipe_app/data/model/equipment.dart';
import 'package:recipe_app/data/model/instruction_step.dart';

class InstructionStepWithEquipments {
  final InstructionStep instructionStep;
  final List<Equipment> equipments;

  InstructionStepWithEquipments({
    required this.instructionStep,
    required this.equipments,
  });
}
