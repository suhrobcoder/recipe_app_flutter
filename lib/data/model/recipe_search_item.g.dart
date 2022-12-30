// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_search_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSearchItem _$RecipeSearchItemFromJson(Map<String, dynamic> json) =>
    RecipeSearchItem(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$RecipeSearchItemToJson(RecipeSearchItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
