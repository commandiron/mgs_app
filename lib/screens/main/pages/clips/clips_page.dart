import 'package:flutter/material.dart';
import 'package:mgs_app/providers/clips.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'widgets/clip_card.dart';

class ClipsPage extends StatefulWidget {
const ClipsPage( {required this.onExpandCollapse,Key? key}) : super(key: key);

  final Function(bool) onExpandCollapse;

  @override
  State<ClipsPage> createState() => _ClipsPageState();
}

class _ClipsPageState extends State<ClipsPage> {

  final PageController _pageController = PageController();
  var _volume = 0.0;
  bool _isExpanded = false;

  void toNextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn
    );
  }

  void toPreviousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn
    );
  }

  @override
  Widget build(BuildContext context) {
    final clips = Provider.of<Clips>(context, listen: false).items;
    return Padding(
      padding: MediaQuery.of(context).padding,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dx > sensitivity) {
            toPreviousPage();
          } else if(details.delta.dx < -sensitivity){
            toNextPage();
          }
        },
        child: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ClipView(
              clip: clips[index % clips.length],
              initialVolume: _volume,
              isExpanded: _isExpanded,
              onVolumeIconPressed: () {
                _volume == 0 ? _volume = 1 : _volume = 0;
              },
              onExpandCollapsePressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
                widget.onExpandCollapse(_isExpanded);
              },
              onNext: toNextPage,
              onBack: toPreviousPage,
              onEnd: toNextPage,
              onSharePressed: () {
                Share.share("Share test!");
              },
            );
          },
        ),
      ),
    );
  }
}


