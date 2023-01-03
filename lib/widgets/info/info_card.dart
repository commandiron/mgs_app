import 'package:flutter/material.dart';

import 'info_body.dart';
import 'info_sub_title.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({required this.title, required this.bodies, this.bodyTextAlign, Key? key}) : super(key: key);

  final String title;
  final List<String> bodies;
  final TextAlign? bodyTextAlign;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Column(
        children: [
          Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                margin: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: InfoSubTitle(title),
                ),
              )
            ]
          ),
          Flex(
            direction: Axis.vertical,
            children:[
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: bodies.map(
                    (body) => InfoBody(body, textAlign: bodyTextAlign),
                  ).toList()
                )
              )
            ]
          )
        ],
      ),
    );
  }
}
