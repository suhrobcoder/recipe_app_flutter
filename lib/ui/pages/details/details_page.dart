import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/ui/components/ingredient_card.dart';
import 'package:recipe_app/ui/components/recipe_card.dart';
import 'package:recipe_app/ui/pages/details/bloc/details_bloc.dart';
import 'package:recipe_app/util/list_ext.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailsPage extends StatelessWidget {
  final Recipe recipe;

  const DetailsPage({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (context) => getIt<DetailsBloc>(param1: recipe),
      child: Scaffold(
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            return SlidingUpPanel(
              minHeight: size.height - size.width * 0.65 + 24,
              maxHeight: size.height,
              parallaxEnabled: true,
              parallaxOffset: 0.5,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24 * (1 - state.panelSlide))),
              onPanelSlide: (position) =>
                  context.read<DetailsBloc>().add(PanelSlide(position)),
              body: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Hero(
                      tag: state.recipe.title,
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: state.recipe.image ?? "",
                        fit: BoxFit.contain,
                        placeholder: (_, __) => const RecipePlaceholder(),
                        errorWidget: (_, __, ___) => const RecipePlaceholder(),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: FilledIconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: FilledIconButton(
                        icon: Icon(
                          state.saved ? Icons.favorite : Icons.favorite_outline,
                          color: Colors.red,
                        ),
                        onPressed: () => context
                            .read<DetailsBloc>()
                            .add(ChangeSaved(!state.saved)),
                      ),
                    ),
                  ],
                ),
              ),
              panelBuilder: (sc) => SingleChildScrollView(
                controller: sc,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        state.recipe.title,
                        style: textTheme.headlineMedium
                            ?.copyWith(color: colorScheme.onBackground),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      MarkdownBody(
                        data: html2md.convert(state.recipe.summary),
                      ),
                      const SizedBox(height: 16),
                      if (state.recipe.allIngredients.isNotEmpty) ...[
                        Text(
                          "Ingredients",
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 74,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: recipe.allIngredients.length,
                            itemBuilder: (context, index) {
                              final ingredient = recipe.allIngredients[index];
                              return IngredientCard(
                                name: ingredient.name,
                                imageUrl: ingredient.getImageUrl(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      if (state.recipe.allEquipments.isNotEmpty) ...[
                        Text(
                          "Equipments",
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 74,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: recipe.allEquipments.length,
                            itemBuilder: (context, index) {
                              final equipment = recipe.allEquipments[index];
                              return IngredientCard(
                                name: equipment.name,
                                imageUrl: equipment.getImageUrl(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      if (state.recipe.analyzedInstructions.isNotEmpty) ...[
                        Text(
                          "Instructions",
                          style: textTheme.titleLarge,
                        ),
                        ...state.recipe.analyzedInstructions[0].steps
                            .mapIndexed((e, i) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        alignment: Alignment.center,
                                        decoration: ShapeDecoration(
                                          shape: const CircleBorder(),
                                          color: colorScheme.secondary,
                                        ),
                                        child: Text(
                                          i.toString(),
                                          style: TextStyle(
                                              color: colorScheme.onSecondary),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(child: Text(e.step)),
                                    ],
                                  ),
                                ))
                            .toList(),
                        const SizedBox(height: 16),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FilledIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const FilledIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: Colors.white,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
