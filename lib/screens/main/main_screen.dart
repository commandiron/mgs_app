import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import '../../widgets/my_app_bar/my_app_bar.dart';
import 'pages/categories/categories_page.dart';
import 'pages/clips/clips_page.dart';
import 'pages/search/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const route = "main";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final PageController _pageController = PageController();
  String _searchText = "";
  bool _showNavBar = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(
        onSearchTextChange: (value) {
          setState(() {
            _searchText = value;
          });
        },
      ),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              CategoriesPage(),
              ClipsPage(
                onExpandCollapse: (isFullScreen) {
                  setState(() {
                    _showNavBar = !isFullScreen;
                  });
                },
              )
            ],
          ),
          if(_searchText.isNotEmpty)
            const SearchPage(),
        ],
      ),
      bottomNavigationBar: _showNavBar ? MyBottomNavigationBar(
        onTab: (index) {
          _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastLinearToSlowEaseIn
          );
        },
      ): null,
      floatingActionButton: _showNavBar ?SizedBox(
        height: 46,
        child: Image.asset("assets/images/foxhound_logo.png")
      ): null,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked
    );
  }
}
