import 'package:flutter/material.dart';
import 'package:mgs_app/widgets/info/info_body.dart';
import 'package:mgs_app/widgets/info/info_title.dart';

class InfoCard2 extends StatelessWidget {
  const InfoCard2(
    {
      required this.title,
      required this.bodies,
      this.bodyTextAlign,
      this.height,
      this.fit = true,
      Key? key
    }
  ) : super(key: key);

  final String title;
  final List<String> bodies;
  final TextAlign? bodyTextAlign;
  final double? height;
  final bool fit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.7),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16)
        )
      ),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InfoTitle(
                        title,
                      ),
                    ),
                  ) ,
                )
              ]
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Column(
                    children: bodies.map(
                      (body) {
                        if(fit) {
                          return FittedBox(
                            child: InfoBody(
                              body,
                            ),
                          );
                        } else {
                          return InfoBody(
                            body,
                            textAlign: TextAlign.start,
                          );
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
