import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/pages/home/pages/search/widgets/search_recipe_card.dart';
import 'package:recipe_app/theme/constantas.dart';

class SearchRecipesGrid extends StatelessWidget {
  final List<RecipeSearchItem> recipes;
  final Function(RecipeSearchItem) onClick;
  final bool loading;
  final bool error;
  final Function? retry;

  final int maxSize = 200;
  final int spacing = 8;

  const SearchRecipesGrid(
      {required this.recipes,
      required this.onClick,
      required this.loading,
      required this.error,
      this.retry,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<RecipeSearchItem>> chunked = [];
    Size size = MediaQuery.of(context).size;
    int width = size.width.toInt();
    double spaceForRecipesList = width - 2 * defaultPadding + spacing;
    int rowItemsCount = (spaceForRecipesList / (maxSize + spacing)).ceil();
    double itemWidth =
        (spaceForRecipesList - spacing * rowItemsCount) / rowItemsCount;
    for (var i = 0; i < recipes.length; i += rowItemsCount) {
      var end = (i + rowItemsCount < recipes.length)
          ? i + rowItemsCount
          : recipes.length;
      chunked.add(recipes.sublist(i, end));
    }
    int rowCount = chunked.length + 1;
    return Expanded(
      child: ListView.builder(
        itemCount: rowCount,
        itemBuilder: (_, index) {
          if (index < rowCount - 1) {
            List<RecipeSearchItem> rowRecipes = chunked[index];
            List<Widget> recipeCards = rowRecipes.map<Widget>((recipe) {
              return Container(
                width: itemWidth,
                padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                child: SearchRecipeCard(
                  title: recipe.title,
                  image: recipe.image,
                  width: itemWidth,
                  onClick: () {},
                ),
              );
            }).toList();
            if (recipeCards.length < rowItemsCount) {
              recipeCards.addAll(
                List.generate(
                  rowItemsCount - recipeCards.length,
                  (index) => null,
                ).map((element) {
                  return Container(
                    width: itemWidth,
                    padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                    child: Container(),
                  );
                }),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipeCards,
            );
          } else {
            if (loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (error) {
              return Center(
                child: ElevatedButton(
                    onPressed: retry != null ? () => retry!() : () {},
                    child: const Text("Retry")),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
