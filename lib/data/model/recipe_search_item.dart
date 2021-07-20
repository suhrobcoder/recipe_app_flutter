class RecipeSearchItem {
  final int id;
  final String title;
  final String? image;

  RecipeSearchItem(this.id, this.title, this.image);

  RecipeSearchItem.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        image = json["image"];
}
