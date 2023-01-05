import 'package:flutter/material.dart';

class InfoTitle extends StatelessWidget {
  const InfoTitle(this.title, {this.color, Key? key}) : super(key: key);

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: color
      ),
    );
  }
}
