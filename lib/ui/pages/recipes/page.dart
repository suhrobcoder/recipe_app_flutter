import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/ui/pages/pages/recipes/widgets/recipe_card.dart';

import 'controller.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 256.0,
          child: Obx(
            () {
              if (Get.find<RecipesPageController>().loading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (Get.find<RecipesPageController>().error.isNotEmpty) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () =>
                        Get.find<RecipesPageController>().loadRandomRecipes(),
                    child: const Text("Retry"),
                  ),
                );
              }
              var recipes = Get.find<RecipesPageController>().randomRecipes;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (_, index) {
                  var recipe = recipes[index];
                  return RecipeCard(
                    recipe.image ?? "",
                    recipe.title,
                    recipe.readyInMinutes,
                    recipe.servings,
                    index == 0
                        ? 1
                        : index == recipes.length - 1
                            ? -1
                            : 0,
                    () =>
                        Get.find<RecipesPageController>().onClickRecipe(recipe),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class RecipesAppBar extends AppBar {
  RecipesAppBar({Key? key})
      : super(
          key: key,
          title: const Text(
            "Recipes",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        );
}
