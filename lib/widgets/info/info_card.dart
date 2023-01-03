import 'package:flutter/material.dart';
import 'package:mgs_app/widgets/info/info_body.dart';
import 'package:mgs_app/widgets/info/info_title.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({required this.title, required this.bodies, this.bodyTextAlign, this.height, this.fit = true, Key? key}) : super(key: key);

  final String title;
  final List<String> bodies;
  final TextAlign? bodyTextAlign;
  final double? height;
  final bool fit;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Container(
        width: double.infinity,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Container(
                  width: double.infinity,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InfoTitle(title),
                      ),
                    )
                  ) ,
                )
              ]
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    children: bodies.map(
                      (body) {
                        if(fit) {
                          return FittedBox(
                            child: InfoBody(body),
                          );
                        } else {
                          return InfoBody(body, textAlign: TextAlign.start,);
                        }
                      }
                    ).toList(),
                  ),
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}
