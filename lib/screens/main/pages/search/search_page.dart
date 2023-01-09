import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/mgs_characters.dart';
import '../../../characters/character_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.9),
      child: Consumer<MgsCharacters>(
          builder: (context, value, child) {
            if(value.characters.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: value.characters.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration: const Duration(seconds: 0),
                            reverseTransitionDuration: const Duration(seconds: 0),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              return CharacterDetailPage(value.characters[index], index);
                            },
                          )
                        );
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 200,
                              width: 200,
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(value.characters[index].imageUrls[0], fit: BoxFit.cover,),
                            ),
                          ),
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                value.characters[index].name,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text("No Result"),);
            }
          },
      ),
    );
  }
}
