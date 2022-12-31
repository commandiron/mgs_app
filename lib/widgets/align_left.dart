import 'package:flutter/material.dart';

class AlignLeft extends StatelessWidget {

  AlignLeft({this.padding, required this.child,  Key? key}) : super(key: key);

  final Widget child;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}
