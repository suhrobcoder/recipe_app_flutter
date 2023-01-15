import 'package:json_annotation/json_annotation.dart';

part 'equipment.g.dart';

@JsonSerializable()
class Equipment {
  final int id;
  final String name;
  final String? image;

  Equipment({
    required this.id,
    required this.name,
    this.image,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentToJson(this);

  String getImageUrl() {
    return "https://spoonacular.com/cdn/ingredients_100x100/$image";
  }

  @override
  bool operator ==(covariant Equipment other) {
    if (identical(this, other)) return true;
    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
