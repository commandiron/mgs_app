import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/searchItems.dart';


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
      child: Consumer<SearchItems>(
        builder: (context, value, child) {
          if(value.items.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: value.items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            width: 200,
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(value.items[index].imageUrl, fit: BoxFit.cover,),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              value.items[index].title,
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
            return Center(
              child: Text(
                "No Result",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.red
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
