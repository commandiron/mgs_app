import 'package:flutter/material.dart';
import 'package:mgs_app/screens/home/widgets/category_list.dart';
import 'package:mgs_app/widgets/app_bar_content/app_bar_content.dart';
import 'package:provider/provider.dart';

import '../../providers/categories.dart';
import '../../widgets/app_bar_content/search.dart';
import 'widgets/video.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: AppBarContent(
          onSearch: (value) {
            print(value);
          }
        ),
      ),
      body: Column(
        children: [
          Video(),
          SizedBox(height: 4,),
          Expanded(child: CategoryList()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Test 1"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: "Clips"
          )
        ],
      ),
    );
  }
}
