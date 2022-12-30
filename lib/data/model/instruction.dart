import 'package:json_annotation/json_annotation.dart';
import 'instruction_step.dart';

part 'instruction.g.dart';

@JsonSerializable()
class Instruction {
  final String name;
  final List<InstructionStep> steps;

  Instruction({
    required this.name,
    required this.steps,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) =>
      _$InstructionFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionToJson(this);
}
