import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/ui/theme/color_theme.dart';
import 'package:recipe_app/ui/theme/constants.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int? readyInMinutes;
  final int? servings;
  final int index;
  final Function onClick;

  const RecipeCard(this.imageUrl, this.title, this.readyInMinutes,
      this.servings, this.index, this.onClick,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      margin: EdgeInsets.only(
        left: index == 1 ? defaultPadding : defaultPadding / 4,
        right: index == -1 ? defaultPadding : defaultPadding / 4,
      ),
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
        onTap: () => onClick(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: SizedBox(
                width: 250,
                height: 160,
                child: Hero(
                  tag: title,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, url) => const RecipePlaceholder(),
                    errorWidget: (_, url, error) => const RecipePlaceholder(),
                  ),
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
                  const SizedBox(height: 4.0),
                  if (readyInMinutes != null)
                    RecipeInfo("ic_clock.svg", "$readyInMinutes mins"),
                  if (servings != null)
                    RecipeInfo("ic_profile.svg", "$servings servings"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeInfo extends StatelessWidget {
  final String icon;
  final String info;

  const RecipeInfo(this.icon, this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/$icon",
            width: 12,
            height: 12,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 6.0),
          Text(
            info,
            style:
                Theme.of(context).textTheme.caption?.copyWith(color: gray500),
          ),
        ],
      ),
    );
  }
}

class RecipePlaceholder extends StatelessWidget {
  const RecipePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/recipe_placeholder.png",
      fit: BoxFit.cover,
    );
  }
}
