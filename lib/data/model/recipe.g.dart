// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: json['id'] as int,
      title: json['title'] as String,
      summary: json['summary'] as String,
      image: json['image'] as String?,
      vegetarian: json['vegetarian'] as bool,
      readyInMinutes: json['readyInMinutes'] as int?,
      instructions: json['instructions'] as String?,
      cuisines:
          (json['cuisines'] as List<dynamic>).map((e) => e as String).toList(),
      diets: (json['diets'] as List<dynamic>).map((e) => e as String).toList(),
      servings: json['servings'] as int,
      analyzedInstructions: (json['analyzedInstructions'] as List<dynamic>)
          .map((e) => Instruction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'image': instance.image,
      'vegetarian': instance.vegetarian,
      'readyInMinutes': instance.readyInMinutes,
      'instructions': instance.instructions,
      'cuisines': instance.cuisines,
      'diets': instance.diets,
      'servings': instance.servings,
      'analyzedInstructions': instance.analyzedInstructions,
    };
