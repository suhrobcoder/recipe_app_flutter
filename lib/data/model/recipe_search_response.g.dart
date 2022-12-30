// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSearchResponse _$RecipeSearchResponseFromJson(
        Map<String, dynamic> json) =>
    RecipeSearchResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => RecipeSearchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      offset: json['offset'] as int,
      number: json['number'] as int,
      totalResults: json['totalResults'] as int,
    );

Map<String, dynamic> _$RecipeSearchResponseToJson(
        RecipeSearchResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'offset': instance.offset,
      'number': instance.number,
      'totalResults': instance.totalResults,
    };
