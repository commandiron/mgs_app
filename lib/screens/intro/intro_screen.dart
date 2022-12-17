import 'package:flutter/material.dart';
import '../main/main_screen.dart';
import 'widgets/video.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static const route = "intro";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Video(
            onEnd: () {
              Navigator.of(context).pushReplacementNamed(MainScreen.route);
            },
          )
        ),
      ),
    );
  }
}
