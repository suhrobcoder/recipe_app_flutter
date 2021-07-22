class Ingredient {
  final int id;
  final String name;
  final String? image;

  Ingredient(this.id, this.name, this.image);

  Ingredient.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        image = json["image"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "image": image,
    };
  }

  Ingredient.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        image = map["image"];
}
