import 'equipment.dart';
import 'ingredient.dart';

class InstructionStep {
  final int number;
  final String step;
  final List<Ingredient> ingredients;
  final List<Equipment> equipments;

  InstructionStep(this.number, this.step, this.ingredients, this.equipments);

  InstructionStep.fromJson(Map<String, dynamic> json)
      : number = json["number"],
        step = json["step"],
        ingredients = (json["ingredients"] as List)
            .map((e) => Ingredient.fromJson(e))
            .toList(),
        equipments = (json["equipment"] as List)
            .map((e) => Equipment.fromJson(e))
            .toList();

  Map<String, dynamic> toMap(int recipeId) {
    return {
      "id": getId(recipeId),
      "recipeId": recipeId,
      "number": number,
      "step": step,
    };
  }
  
  int getId(int recipeId) {
    return recipeId * 100 + number;
  }

  InstructionStep.fromMap(
    Map<String, dynamic> map,
    this.ingredients,
    this.equipments,
  )   : number = map["number"],
        step = map["step"];
}
