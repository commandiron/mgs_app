import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/mgs_characters.dart';

class CharacterImageHero extends StatefulWidget {

  const CharacterImageHero({this.imageWidth, this.imageHeight, this.topRadius = 0, this.scrollPhysics, required this.index, Key? key}) : super(key: key);

  final double? imageWidth;
  final double? imageHeight;
  final double topRadius;
  final ScrollPhysics? scrollPhysics;
  final int index;

  @override
  State<CharacterImageHero> createState() => _CharacterImageHeroState();
}

class _CharacterImageHeroState extends State<CharacterImageHero> {

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {

    final characters = Provider.of<MgsCharacters>(context, listen: false).characters;

    return Hero(
      tag: "character_image_hero_${widget.index}",
      child: SizedBox(
        width: widget.imageWidth,
        height: widget.imageHeight,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(widget.topRadius),
            bottom: const Radius.circular(30)
          ),
          child: Stack(
            children: [
              PageView.builder(
                physics: widget.scrollPhysics,
                itemCount: characters[widget.index].imageUrls.length,
                onPageChanged: (pageIndex) {
                  setState(() {
                    _selectedPageIndex = pageIndex;
                  });
                },
                itemBuilder: (context, pageIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(characters[widget.index].imageUrls[pageIndex]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              if(characters[widget.index].imageUrls.length > 1)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 64),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(
                        length: characters[widget.index].imageUrls.length,
                        pageIndex: _selectedPageIndex
                      ),
                    ),
                  )
                )
            ],
          )
        ),
      )
    );
  }

  List<Widget> _buildPageIndicator({required int length, required int pageIndex}) {
    List<Widget> list = [];
    for (int i = 0; i < length; i++) {
      list.add(i == pageIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive
            ? 10 : 8.0,
        width: isActive
            ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
              ? BoxShadow(
                color: const Color(0XFF2FB7B2).withOpacity(0.72),
                blurRadius: 4.0,
                spreadRadius: 1.0,
                offset: const Offset(
                  0.0,
                  0.0,
                ),
              )
              : const BoxShadow(
                color: Colors.transparent,
              )
          ],
          shape: BoxShape.circle,
          color: isActive
            ? const Color(0XFF6BC4C9)
            : const Color(0XFFEAEAEA),
        ),
      ),
    );
  }
}
