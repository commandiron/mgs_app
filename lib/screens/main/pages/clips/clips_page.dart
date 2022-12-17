import 'package:flutter/material.dart';

import '../../../../util/page_route.dart';

class ClipsPage extends StatefulWidget {
  const ClipsPage({Key? key}) : super(key: key);

  static final pageRoute = MyPageRoute(route: "clips", index: 1);

  @override
  State<ClipsPage> createState() => _ClipsPageState();
}

class _ClipsPageState extends State<ClipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Clips Screen"),),
    );
  }
}
