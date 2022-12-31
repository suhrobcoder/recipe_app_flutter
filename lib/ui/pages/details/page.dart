import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/ui/pages/details/controller.dart';
import 'package:recipe_app/ui/pages/pages/recipes/widgets/recipe_card.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailsController controller = Get.find<DetailsController>();
    return Scaffold(
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        Recipe recipe = controller.recipe.value!;
        return Column(
          children: [
            Hero(
              tag: recipe.title,
              child: CachedNetworkImage(
                width: double.infinity,
                imageUrl: recipe.image ?? "",
                placeholder: (_, __) => const RecipePlaceholder(),
                errorWidget: (_, __, ___) => const RecipePlaceholder(),
              ),
            ),
            BottomSheet(
              onClosing: () {},
              builder: (_) => Column(
                children: [
                  Text(recipe.title, style: TextStyle(fontSize: 36.0)),
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
      }),
    );
  }
}
