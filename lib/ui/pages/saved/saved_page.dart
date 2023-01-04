import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/ui/components/search_recipes_grid.dart';
import 'package:recipe_app/ui/pages/details/details_page.dart';
import 'package:recipe_app/ui/pages/saved/bloc/saved_bloc.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SavedBloc>(),
      child: BlocBuilder<SavedBloc, SavedState>(
        builder: (context, state) {
          return SearchRecipesGrid(
            recipes: state.recipes
                .map((e) =>
                    RecipeSearchItem(id: e.id, title: e.title, image: e.image))
                .toList(),
            onClick: (recipe) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                    recipe: state.recipes.firstWhere((e) => e.id == recipe.id)),
              ),
            ),
            loading: false,
            error: false,
          );
        },
      ),
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
