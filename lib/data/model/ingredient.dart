import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  final int id;
  final String name;
  final String? image;

  Ingredient({
    required this.id,
    required this.name,
    this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  String getImageUrl() {
    return "https://spoonacular.com/cdn/ingredients_100x100/$image";
  }

  @override
  bool operator ==(covariant Ingredient other) {
    if (identical(this, other)) return true;
    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
