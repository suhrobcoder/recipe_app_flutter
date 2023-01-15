import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/database/saved_recipes_database.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/ui/components/recipe_card.dart';
import 'package:recipe_app/ui/pages/details/details_page.dart';
import 'package:recipe_app/ui/pages/recipes/bloc/recipes_bloc.dart';
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
          return Column(
            children: [
              SizedBox(
                height: 270.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.recipes.length,
                  padding: const EdgeInsets.only(bottom: 20.0),
                  itemBuilder: (_, index) {
                    var recipe = state.recipes[index];
                    return RecipeCard(
                      recipe.image ?? "",
                      recipe.title,
                      recipe.readyInMinutes,
                      recipe.servings,
                      index == 0
                          ? 1
                          : index == state.recipes.length - 1
                              ? -1
                              : 0,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsPage(recipe: recipe),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DriftDbViewer(getIt<SavedRecipesDatabase>()))),
                child: Text("Open database"),
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
