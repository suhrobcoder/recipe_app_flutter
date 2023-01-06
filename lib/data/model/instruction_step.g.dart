// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstructionStep _$InstructionStepFromJson(Map<String, dynamic> json) =>
    InstructionStep(
      number: json['number'] as int,
      step: json['step'] as String,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      equipments: (json['equipments'] as List<dynamic>?)
              ?.map((e) => Equipment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$InstructionStepToJson(InstructionStep instance) =>
    <String, dynamic>{
      'number': instance.number,
      'step': instance.step,
      'ingredients': instance.ingredients,
      'equipments': instance.equipments,
    };
