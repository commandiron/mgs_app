import 'package:flutter/material.dart';

class InfoBody extends StatelessWidget {
  const InfoBody(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
