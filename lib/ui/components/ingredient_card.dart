import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const IngredientCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Image.asset("assets/images/recipe_placeholder.png"),
            errorWidget: (context, url, err) =>
                Image.asset("assets/images/recipe_placeholder.png"),
          ),
        ),
        SizedBox(
          width: 64,
          child: Text(
            name,
            style: textTheme.labelSmall,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
