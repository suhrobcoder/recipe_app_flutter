import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recipe_app/pages/home/controller.dart';
import 'package:recipe_app/theme/color_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          currentIndex: Get.find<HomePageController>().selectedTab.value,
          selectedItemColor: Colors.black,
          unselectedItemColor: gray500,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => Get.find<HomePageController>().selectedTab(index),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: Get.find<HomePageController>().selectedTab.value,
            children: homeContents.map((screen) => screen.content).toList(),
          ),
        ),
      ),
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
      asset,
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

  HomeBottomNav(this.title, this.icon, this.content);
}

final homeContents = [
  HomeBottomNav("Recipes", "assets/icons/ic_recipe.svg", Text("Recipes")),
  HomeBottomNav("Search", "assets/icons/ic_search.svg", Text("Search")),
  HomeBottomNav("Saved", "assets/icons/ic_bookmark.svg", Text("Saved")),
  HomeBottomNav("Settings", "assets/icons/ic_settings.svg", Text("Settings")),
];
