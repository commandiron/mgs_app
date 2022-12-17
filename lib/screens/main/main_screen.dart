import 'package:flutter/material.dart';
import 'package:mgs_app/helpers/isKeyboardOpen.dart';

import '../../widgets/app_bar_content/app_bar_content.dart';
import '../../widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';
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

  bool _showFab = true;

  void startFabAnimation() async {
    while(true) {
      await Future.delayed(
        const Duration(seconds: 5)
      ).then(
        (value) {
          setState(() {
            _showFab = false;
          });
        }
      );
      await Future.delayed(
        const Duration(milliseconds: 500)
      ).then(
        (value) {
          setState(() {
            _showFab = true;
          });
        }
      );
    }
  }

  Widget _buildFab() {
    return SizedBox(
        height: 46,
        child: Image.asset("assets/images/foxhound_logo.png")
    );
  }

  @override
  void initState() {
    startFabAnimation();
    super.initState();
  }

  final PageController _pageController = PageController();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: AppBarContent(
          onSearchTextChange: (value) {
            setState(() {
              _searchText = value;
            });
          }
        ),
      ),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: const [
              CategoriesPage(),
              ClipsPage()
            ],
          ),
          if(_searchText.isNotEmpty)
            const SearchPage(),
        ],
      ),

      bottomNavigationBar: MyBottomNavigationBar(
        onTab: (pageRoute) {
          _pageController.animateToPage(
              pageRoute.index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastLinearToSlowEaseIn
          );
        },
      ),
      floatingActionButton: !isKeyboardOpen(context) ? _showFab ? _buildFab() : null : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked
    );
  }
}
