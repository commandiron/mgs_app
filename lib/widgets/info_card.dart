import 'package:flutter/material.dart';

import 'info_body.dart';
import 'info_sub_title.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({required this.title, required this.body, Key? key}) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InfoSubTitle(title),
            const SizedBox(height: 8,),
            InfoBody(body)
          ],
        ),
      ),
    );
  }
}
