import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/ui/components/search_recipes_grid.dart';
import 'package:recipe_app/ui/pages/details/details_page.dart';
import 'package:recipe_app/ui/pages/search/bloc/search_bloc.dart';
import 'package:recipe_app/ui/theme/color_theme.dart';
import 'package:recipe_app/ui/theme/constants.dart';
import 'package:recipe_app/ui/components/recipe_chip.dart';
import 'package:recipe_app/util/contants.dart';
import 'package:recipe_app/util/ui_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: gray500.withAlpha(40),
                    borderRadius: BorderRadius.circular(40)),
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 8,
                ),
                margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: TextField(
                  controller: state.searchController,
                  style: const TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    icon: SvgPicture.asset(
                      "assets/icons/ic_search.svg",
                      width: 20.0,
                      height: 20.0,
                      color: Colors.black45,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => showFilterBottomSheet(context),
                      splashRadius: 24,
                      icon: SvgPicture.asset(
                        "assets/icons/ic_equalizer.svg",
                        width: 20.0,
                        height: 20.0,
                        color: Colors.black45,
                      ),
                    ),
                    hintText: "What are you searching for?",
                    hintStyle: const TextStyle(color: Colors.black45),
                    border: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (_) =>
                      context.read<SearchBloc>().add(ExecuteSearch()),
                ),
              ),
              const SizedBox(height: defaultPadding),
              SearchRecipesGrid(
                recipes: state.results,
                onClick: (recipe) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            DetailsPage(recipe: recipe.toRecipe())))),
                loading: state.uiState is UiStateLoading,
                error: state.uiState is UiStateError,
                retry: () => context.read<SearchBloc>().add(ExecuteSearch()),
              ),
            ],
          );
        },
      ),
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 48.0,
                        height: 6.0,
                        margin: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: gray500,
                            borderRadius: BorderRadius.circular(3.0)),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Filter",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () =>
                              context.read<SearchBloc>().add(ClearAll()),
                          child: const Text("Clear All"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding),
                        const Text(
                          "Meal type",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: defaultPadding / 4),
                        Wrap(
                          spacing: defaultPadding / 4,
                          runSpacing: defaultPadding / 4,
                          children: mealTypes
                              .map(
                                (mealType) => RecipeChip(
                                  mealType,
                                  state.mealType == mealType,
                                  () => context
                                      .read<SearchBloc>()
                                      .add(SelectMealType(mealType)),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: defaultPadding),
                        const Text(
                          "Max cook time",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: defaultPadding / 4),
                        Slider(
                          value: state.cookTime.toDouble(),
                          onChanged: (value) => context
                              .read<SearchBloc>()
                              .add(ChangeCookTime(value.toInt())),
                          max: 60,
                          divisions: 60,
                          label: state.cookTime.toString(),
                        ),
                        const Text(
                          "Diet",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: defaultPadding / 4),
                        Wrap(
                          spacing: defaultPadding / 4,
                          runSpacing: defaultPadding / 4,
                          children: diets
                              .map(
                                (diet) => RecipeChip(
                                  diet,
                                  state.diet == diet,
                                  () => context
                                      .read<SearchBloc>()
                                      .add(SelectDiet(diet)),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: defaultPadding),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class SearchAppBar extends AppBar {
  SearchAppBar({Key? key})
      : super(
          key: key,
          title: const Text(
            "Search",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        );
}
