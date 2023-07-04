import 'package:daily_notes/locator.dart';
import 'package:daily_notes/screens/home/helpers/view_type.dart';
import 'package:daily_notes/screens/home/store/home_view.store.dart';
import 'package:daily_notes/screens/home/views/folders.home.view.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  final viewStore = locator<HomeViewStore>();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    viewStore.setCurrentView(
      _tabController.index == 0 ? HViewType.notes : HViewType.folders,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Expanded(
        child: Column(
          children: [
            const SizedBox(height: 5),
            TabBar(
              controller: _tabController,
              onTap: (_) => _handleTabChange(),
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Folder'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
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
