import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/ui/components/recipe_card.dart';
import 'package:recipe_app/ui/pages/details/bloc/details_bloc.dart';

class DetailsPage extends StatelessWidget {
  final Recipe recipe;

  const DetailsPage({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailsBloc>(param1: recipe),
      child: Scaffold(
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            return Column(
              children: [
                Hero(
                  tag: state.recipe.title,
                  child: CachedNetworkImage(
                    width: double.infinity,
                    imageUrl: state.recipe.image ?? "",
                    placeholder: (_, __) => const RecipePlaceholder(),
                    errorWidget: (_, __, ___) => const RecipePlaceholder(),
                  ),
                ),
                BottomSheet(
                  onClosing: () {},
                  builder: (_) => Column(
                    children: [
                      Text(state.recipe.title,
                          style: const TextStyle(fontSize: 36.0)),
                    ],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  backgroundColor: Colors.blue,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
