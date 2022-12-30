import 'package:json_annotation/json_annotation.dart';

part 'recipe_search_item.g.dart';

@JsonSerializable()
class RecipeSearchItem {
  final int id;
  final String title;
  final String? image;

  RecipeSearchItem({
    required this.id,
    required this.title,
    this.image,
  });

  factory RecipeSearchItem.fromJson(Map<String, dynamic> json) =>
      _$RecipeSearchItemFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeSearchItemToJson(this);
}
