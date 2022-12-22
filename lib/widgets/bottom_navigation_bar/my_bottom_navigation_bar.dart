import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {

  const MyBottomNavigationBar({required this.onTab,Key? key}) : super(key: key);

  final Function onTab;

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white.withOpacity(0.9),
      currentIndex: _selectedIndex,
      onTap: (index) {
        widget.onTab(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: "Categories"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: "Clips"
        )
      ],
    );
  }
}
