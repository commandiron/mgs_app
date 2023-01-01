import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({this.width, this.height, this.child, Key? key}) : super(key: key);

  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xffEDEDED), Color(0xffDCDCDC)],
            begin: Alignment.center,
            end: Alignment.bottomCenter),
      ),
      child: child,
    );
  }
}
