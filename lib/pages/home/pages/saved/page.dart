import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/pages/home/pages/saved/controller.dart';
import 'package:recipe_app/pages/home/pages/search/widgets/search_recipes_grid.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => SearchRecipesGrid(
            recipes: Get.find<SavedPageController>()
                .savedRecipes
                .map((e) => RecipeSearchItem(e.id, e.title, e.image))
                .toList(),
            onClick: (recipe) =>
                Get.find<SavedPageController>().clickRecipe(recipe.id),
            loading: false,
            error: false,
          ),
        ),
      ],
    );
  }
}

class SavedAppBar extends AppBar {
  SavedAppBar({Key? key})
      : super(
          key: key,
          title: const Text(
            "Saved",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        );
}
