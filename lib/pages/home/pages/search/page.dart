import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recipe_app/data/services/recipe_api_service.dart';
import 'package:recipe_app/pages/home/pages/search/controller.dart';
import 'package:recipe_app/pages/home/pages/search/widgets/search_recipes_grid.dart';
import 'package:recipe_app/theme/color_theme.dart';
import 'package:recipe_app/theme/constantas.dart';
import 'package:recipe_app/widgets/recipe_chip.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final textController = TextEditingController();
  final controller = Get.find<SearchPageController>();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            controller: textController,
            style: const TextStyle(fontSize: 18.0),
            decoration: InputDecoration(
              icon: SvgPicture.asset(
                "assets/icons/ic_search.svg",
                width: 20.0,
                height: 20.0,
                color: Colors.black45,
              ),
              suffixIcon: IconButton(
                onPressed: () => showFilterBottomSheet(),
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
            onSubmitted: (text) => controller.search(text),
          ),
        ),
        const SizedBox(height: defaultPadding),
        Obx(() {
          return SearchRecipesGrid(
            recipes: controller.searchResults,
            onClick: (recipe) => controller.recipeClick(recipe),
            loading: controller.loading.value,
            error: controller.error.value.isNotEmpty,
            retry: () => controller.search(textController.text),
          );
        }),
      ],
    );
  }

  void showFilterBottomSheet() {
    Get.bottomSheet(
      Column(
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
                      onPressed: () => controller.clearAll(),
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
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
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
                    Obx(
                      () => Wrap(
                        spacing: defaultPadding / 4,
                        runSpacing: defaultPadding / 4,
                        children: mealTypes
                            .map(
                              (mealType) => RecipeChip(
                                mealType,
                                controller.mealType.value == mealType,
                                () => controller.selectMealType(mealType),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    const Text(
                      "Max cook time",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: defaultPadding / 4),
                    Obx(() => Slider(
                          value: controller.cookTime.value.toDouble(),
                          onChanged: (value) => controller.setCookTime(value),
                          max: 60,
                          divisions: 60,
                          label: controller.cookTime.toString(),
                        )),
                    const Text(
                      "Diet",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: defaultPadding / 4),
                    Obx(
                      () => Wrap(
                        spacing: defaultPadding / 4,
                        runSpacing: defaultPadding / 4,
                        children: diets
                            .map(
                              (diet) => RecipeChip(
                                diet,
                                controller.diet.value == diet,
                                () => controller.selectDiet(diet),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                  ],
                ),
              ),
            ),
          ),
        ],
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
