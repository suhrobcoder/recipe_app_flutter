class Equipment {
  final int id;
  final String name;
  final String? image;

  Equipment(this.id, this.name, this.image);

  Equipment.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        image = json["image"];

  Map<String, dynamic> toMap(int instructionId) {
    return {
      "id": id,
      "instructionId": instructionId,
      "name": name,
      "image": image,
    };
  }

  Equipment.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        image = map["image"];
}
