import 'dart:ui';

import 'package:flutter/material.dart';

import 'widgets/search.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/mgs_logo.jpg",
                width: 160,
                fit: BoxFit.cover,
              )
            ),
            Expanded(
              flex: 3,
              child: Search(
                onSearch: (value) {
                  print(value);
                },
              )
            ),
          ],
        )
      ),
      body: Center(
        child: Text("adadsa")
      ),
    );
  }
}
