import 'package:daily_notes/screens/home/views/folders.home.view.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 5),
            TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Folder'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text('All Notes'),
                  ),
                  SingleChildScrollView(
                    child: FoldersView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
