// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_recipes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomRecipesResponse _$RandomRecipesResponseFromJson(
        Map<String, dynamic> json) =>
    RandomRecipesResponse(
      recipes: (json['recipes'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RandomRecipesResponseToJson(
        RandomRecipesResponse instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
    };
