import 'package:flutter/material.dart';

class InfoTitle extends StatelessWidget {
  const InfoTitle(this.title, {this.style, Key? key}) : super(key: key);

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? Theme.of(context).textTheme.titleLarge,
    );
  }
}
