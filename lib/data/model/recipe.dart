import 'instruction.dart';

class Recipe {
  final int id;
  final String title;
  final String summary;
  final String? image;
  final bool vegetarian;
  final int? readyInMinutes;
  final String? instructions;
  final List<String> cuisines;
  final List<String> diets;
  final List<Instruction> analyzedInstructions;

  Recipe(
      this.id,
      this.title,
      this.summary,
      this.image,
      this.vegetarian,
      this.readyInMinutes,
      this.instructions,
      this.cuisines,
      this.diets,
      this.analyzedInstructions);

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        summary = json["summary"],
        image = json["image"],
        vegetarian = json["vegetarian"],
        readyInMinutes = json["readyInMinutes"],
        instructions = json["instructions"],
        cuisines = (json["cuisines"] as List).map((e) => e as String).toList(),
        diets = (json["diets"] as List).map((e) => e as String).toList(),
        analyzedInstructions = (json["analyzedInstructions"] as List)
            .map((e) => Instruction.fromJson(e))
            .toList();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "summary": summary,
      "image": image,
      "vegetarian": vegetarian,
      "readyInMinutes": readyInMinutes,
      "instructions": instructions,
      "cuisines": cuisines.join("|"),
      "diets": diets.join("|"),
    };
  }

  Recipe.fromMap(Map<String, dynamic> map, this.analyzedInstructions)
      : id = map["id"],
        title = map["title"],
        summary = map["summary"],
        image = map["image"],
        vegetarian = map["vegetarian"],
        readyInMinutes = map["readyInMinutes"],
        instructions = map["instructions"],
        cuisines = (map["cuisines"] as String).split("|"),
        diets = (map["diets"] as String).split("|");
}
