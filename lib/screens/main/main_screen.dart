import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mgs_app/widgets/background_container.dart';
import 'package:provider/provider.dart';
import '../../providers/searchItems.dart';
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
  bool _showBars = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(),
      body: BackgroundContainer(child: _buildBody()),
      bottomNavigationBar: _buildNavigationBar(),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked);
  }

  PreferredSizeWidget? _buildAppBar() {
    return MyAppBar(
      visible: _showBars,
      onSearchTextChange: (value) {
        setState(() {
          _searchText = value;
          Provider.of<SearchItems>(context, listen: false).search(value, 1, 50);
        });
      },
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            const CategoriesPage(),
            ClipsPage(
              onExpandCollapse: (isClipExpanded) {
                setState(() {
                  _showBars = !isClipExpanded;
                });
              },
            )
          ],
        ),
        if (_searchText.isNotEmpty) const SearchPage(),
      ],
    );
  }

  Widget? _buildNavigationBar() {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
        height: _showBars
            ? Platform.isIOS
                ? 89.0
                : 56.0
            : 0.0,
        child: MyBottomNavigationBar(
          onTab: (index) {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.fastLinearToSlowEaseIn);
          },
        ),
      ),
    );
  }

  Widget? _buildFab() {
    return _showBars
        ? SizedBox(
            height: 46, child: Image.asset("assets/images/foxhound_logo.png"))
        : null;
  }
}
