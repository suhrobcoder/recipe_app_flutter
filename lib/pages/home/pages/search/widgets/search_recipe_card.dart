import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home/pages/recipes/widgets/recipe_card.dart';
import 'package:recipe_app/theme/constantas.dart';

class SearchRecipeCard extends StatelessWidget {
  final String title;
  final String? image;
  final double width;
  final Function onClick;
  const SearchRecipeCard(
      {required this.title,
      required this.image,
      required this.width,
      required this.onClick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(bottom: defaultPadding / 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            spreadRadius: 1.0,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () => onClick,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Container(
                width: width,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: image ?? "",
                  fit: BoxFit.cover,
                  placeholder: (_, url) => const RecipePlaceholder(),
                  errorWidget: (_, url, error) => const RecipePlaceholder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding * 3 / 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
