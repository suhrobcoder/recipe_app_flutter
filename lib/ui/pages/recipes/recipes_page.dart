import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/ui/components/recipe_card.dart';
import 'package:recipe_app/ui/components/recipe_grid_card.dart';
import 'package:recipe_app/ui/pages/details/details_page.dart';
import 'package:recipe_app/ui/pages/recipes/bloc/recipes_bloc.dart';
import 'package:recipe_app/ui/theme/constants.dart';
import 'package:recipe_app/util/ui_state.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecipesBloc>(),
      child: BlocBuilder<RecipesBloc, RecipesState>(
        builder: (context, state) {
          if (state.uiState is UiStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.uiState is UiStateError) {
            return Center(
              child: Text((state.uiState as UiStateError).message),
            );
          }
          return CustomScrollView(
            slivers: [
              // const SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //         horizontal: defaultPadding, vertical: defaultPadding / 2),
              //     child: Text(
              //       "For you",
              //       style:
              //           TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
              //     ),
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: SizedBox(
              //     height: 270.0,
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: state.recipes.length,
              //       padding: const EdgeInsets.only(bottom: 20.0),
              //       itemBuilder: (_, index) {
              //         var recipe = state.recipes[index];
              //         return RecipeCard(
              //           recipe.image ?? "",
              //           recipe.title,
              //           recipe.readyInMinutes,
              //           recipe.servings,
              //           index == 0
              //               ? 1
              //               : index == state.recipes.length - 1
              //                   ? -1
              //                   : 0,
              //           () => Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (_) => DetailsPage(recipe: recipe),
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding / 2),
                  child: Text(
                    "Random",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: state.random.length,
                itemBuilder: (context, index) {
                  var recipe = state.random[index];
                  return RecipeGridCard(
                    recipe.image ?? "",
                    recipe.title,
                    recipe.readyInMinutes,
                    recipe.servings,
                    index,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(recipe: recipe),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
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
