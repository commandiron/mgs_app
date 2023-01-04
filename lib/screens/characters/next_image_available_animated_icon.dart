import 'package:flutter/material.dart';

class NextImageAvailableAnimatedIcon extends StatefulWidget {
  const NextImageAvailableAnimatedIcon({Key? key}) : super(key: key);

  @override
  State<NextImageAvailableAnimatedIcon> createState() => _NextImageAvailableAnimatedIconState();
}

class _NextImageAvailableAnimatedIconState extends State<NextImageAvailableAnimatedIcon> with TickerProviderStateMixin {

  late AnimationController animationController1;
  late AnimationController animationController2;
  late AnimationController animationController3;

  @override
  void initState() {
    animationController1 =  AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
      lowerBound: 0.1,
      upperBound: 1.0
    );
    animationController2 =  AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
        lowerBound: 0.1,
        upperBound: 1.0
    );
    animationController3 =  AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
        lowerBound: 0.1,
        upperBound: 1.0
    );


    startAnimation();
    super.initState();
  }


  startAnimation() async {
    startAnimation1();
    startAnimation2();
    startAnimation3();
  }

  startAnimation1() async {
    await Future.delayed(Duration(milliseconds: 0));
    animationController3.repeat(
        reverse: true
    );
  }
  startAnimation2() async {
    await Future.delayed(Duration(milliseconds: 500));
    animationController2.repeat(
        reverse: true
    );
  }
  startAnimation3() async {
    await Future.delayed(Duration(milliseconds: 1000));
    animationController1.repeat(
        reverse: true
    );
  }


  @override
  void dispose() {
    animationController1.dispose();
    animationController2.dispose();
    animationController3.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: animationController1,
                    builder: (BuildContext context, Widget? child) {
                      return Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white.withOpacity(animationController1.value),
                        size: 50,
                      );
                    }
                  ),
                  AnimatedBuilder(
                    animation: animationController2,
                    builder: (BuildContext context, Widget? child) {
                      return Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white.withOpacity(animationController2.value),
                        size: 50,
                      );
                    }
                  ),
                  AnimatedBuilder(
                    animation: animationController3,
                    builder: (BuildContext context, Widget? child) {
                      return Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white.withOpacity(animationController3.value),
                        size: 50,
                      );
                    },
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
