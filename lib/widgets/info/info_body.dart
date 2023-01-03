import 'package:flutter/material.dart';

class InfoBody extends StatelessWidget {
  const InfoBody(this.title, {this.textAlign, Key? key}) : super(key: key);

  final String title;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
