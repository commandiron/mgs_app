import 'package:flutter/material.dart';

class NextImageAvailableAnimatedIcon extends StatefulWidget {
  const NextImageAvailableAnimatedIcon({Key? key}) : super(key: key);

  @override
  State<NextImageAvailableAnimatedIcon> createState() => _NextImageAvailableAnimatedIconState();
}

class _NextImageAvailableAnimatedIconState extends State<NextImageAvailableAnimatedIcon> {

  double _firstOpacity = 1.0;
  double _secondOpacity = 1.0;
  double _thirdOpacity = 1.0;

  @override
  void initState() {
    _startAnimation();
    super.initState();
  }

  _startAnimation() {
    Future.delayed(Duration(seconds: 1));
    _firstOpacity = 0.1;
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: _firstOpacity,
                    duration: Duration(milliseconds: 500),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            Container(
              alignment: Alignment.center,
              child: Text(
                "swipe",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
