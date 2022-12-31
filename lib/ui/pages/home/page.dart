import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recipe_app/ui/pages/home/controller.dart';
import 'package:recipe_app/ui/pages/pages/recipes/page.dart';
import 'package:recipe_app/ui/pages/pages/saved/page.dart';
import 'package:recipe_app/ui/pages/pages/search/page.dart';
import 'package:recipe_app/ui/pages/pages/settings/page.dart';
import 'package:recipe_app/ui/theme/color_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var controller = Get.find<HomePageController>();
        var selectedTab = controller.selectedTab.value;
        return Scaffold(
          appBar: homeContents[selectedTab].appBar,
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              items: homeContents
                  .map(
                    (screen) => BottomNavigationBarItem(
                      icon: BottomNavIcon(
                        screen.icon,
                        Get.find<HomePageController>().selectedTab.value ==
                            homeContents.indexOf(screen),
                      ),
                      label: screen.title,
                    ),
                  )
                  .toList(),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: selectedTab,
              selectedItemColor: Colors.black,
              unselectedItemColor: gray500,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              type: BottomNavigationBarType.fixed,
              onTap: (index) => controller.selectedTab(index),
            ),
          ),
          body: IndexedStack(
            index: selectedTab,
            children: homeContents.map((screen) => screen.content).toList(),
          ),
        );
      },
    );
  }
}

class BottomNavIcon extends StatelessWidget {
  final String asset;
  final bool selected;
  const BottomNavIcon(this.asset, this.selected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/$asset",
      width: 24,
      height: 24,
      color: selected ? Colors.black : gray500,
    );
  }
}

class HomeBottomNav {
  final String title;
  final String icon;
  final Widget content;
  final AppBar appBar;

  HomeBottomNav(this.title, this.icon, this.content, this.appBar);
}

final homeContents = [
  HomeBottomNav("Recipes", "ic_recipe.svg", RecipesPage(), RecipesAppBar()),
  HomeBottomNav("Search", "ic_search.svg", SearchPage(), SearchAppBar()),
  HomeBottomNav("Saved", "ic_bookmark.svg", SavedPage(), SavedAppBar()),
  HomeBottomNav(
      "Settings", "ic_settings.svg", SettingsPage(), SettingsAppBar()),
];
