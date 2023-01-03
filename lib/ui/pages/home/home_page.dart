import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/ui/pages/home/bloc/home_bloc.dart';
import 'package:recipe_app/ui/pages/recipes/recipes_page.dart';
import 'package:recipe_app/ui/pages/saved/page.dart';
import 'package:recipe_app/ui/pages/search/page.dart';
import 'package:recipe_app/ui/pages/settings/page.dart';
import 'package:recipe_app/ui/theme/color_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: homeContents[state.selectedTab].appBar,
            bottomNavigationBar: BottomNavigationBar(
              items: homeContents
                  .map(
                    (screen) => BottomNavigationBarItem(
                      icon: BottomNavIcon(
                        screen.icon,
                        state.selectedTab == homeContents.indexOf(screen),
                      ),
                      label: screen.title,
                    ),
                  )
                  .toList(),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: state.selectedTab,
              selectedItemColor: Colors.black,
              unselectedItemColor: gray500,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              type: BottomNavigationBarType.fixed,
              onTap: (index) => context.read<HomeBloc>().add(SelectTab(index)),
            ),
            body: IndexedStack(
              index: state.selectedTab,
              children: homeContents.map((screen) => screen.content).toList(),
            ),
          );
        },
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
  HomeBottomNav(
      "Recipes", "ic_recipe.svg", const RecipesPage(), RecipesAppBar()),
  HomeBottomNav("Search", "ic_search.svg", const SearchPage(), SearchAppBar()),
  HomeBottomNav("Saved", "ic_bookmark.svg", const SavedPage(), SavedAppBar()),
  HomeBottomNav(
      "Settings", "ic_settings.svg", const SettingsPage(), SettingsAppBar()),
];
