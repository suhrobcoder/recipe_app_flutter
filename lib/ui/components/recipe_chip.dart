import 'package:flutter/material.dart';
import 'package:recipe_app/ui/theme/color_theme.dart';
import 'package:recipe_app/ui/theme/constants.dart';

class RecipeChip extends StatelessWidget {
  final String text;
  final bool selected;
  final Function onClick;
  const RecipeChip(this.text, this.selected, this.onClick, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color selectedTextColor = Theme.of(context).colorScheme.onPrimary;
    Color unselectedTextColor = Theme.of(context).colorScheme.onBackground;
    return AnimatedContainer(
      duration: const Duration(milliseconds: defualtAnimDuration),
      child: GestureDetector(
        onTap: () => onClick(),
        child: Container(
          decoration: BoxDecoration(
            color:
                selected ? Theme.of(context).primaryColor : Colors.transparent,
            border: Border.all(
                width: 1.0, color: selected ? Colors.transparent : gray500),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: selected ? selectedTextColor : unselectedTextColor,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
