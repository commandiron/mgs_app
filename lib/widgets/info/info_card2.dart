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
      color: Colors.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16)
        )
      ),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: Column(
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InfoTitle(
                        title,
                        color: Colors.white
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
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    children: bodies.map(
                      (body) {
                        if(fit) {
                          return FittedBox(
                            child: InfoBody(
                              body,
                              color: Colors.white
                            ),
                          );
                        } else {
                          return InfoBody(
                            body,
                            textAlign: TextAlign.start,
                            color: Colors.white
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
