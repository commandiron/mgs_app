import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({this.startColor, this.endColor, this.width, this.height, this.child, Key? key}) : super(key: key);

  final Color? startColor;
  final Color? endColor;
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [startColor ?? Color(0xffEDEDED), endColor ?? Color(0xffD4E1EA)],
            begin: Alignment.center,
            end: Alignment.bottomCenter),
      ),
      child: child,
    );
  }
}
