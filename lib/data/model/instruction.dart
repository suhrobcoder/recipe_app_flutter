import 'instruction_step.dart';

class Instruction {
  final String name;
  final List<InstructionStep> steps;

  Instruction(this.name, this.steps);

  Instruction.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        steps = (json["steps"] as List)
            .map((e) => InstructionStep.fromJson(e))
            .toList();
}
