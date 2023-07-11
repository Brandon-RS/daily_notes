import 'dart:io';

import 'package:daily_notes/constants/color.constants.dart';
import 'package:daily_notes/file_management/file_management.dart';
import 'package:daily_notes/file_management/store/fm.store.dart';
import 'package:daily_notes/locator.dart';
import 'package:daily_notes/screens/home/helpers/view_type.dart';
import 'package:daily_notes/screens/home/store/home_view.store.dart';
import 'package:daily_notes/screens/home/widgets/home.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _fmStore = locator<FMStore>();
  late ReactionDisposer reaction;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewStore = locator<HomeViewStore>();
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: DNDark.mainGradient),
        ),
        child: SafeArea(
          child: Column(
            children: [
              if (Platform.isAndroid) const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          ),
                        ),
                        child: Text(
                          'Edit',
                          style: TextStyle(color: DNDark.grey),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, size: 28),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: DNDark.grey),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Tabs(),
            ],
          ),
        ),
      ),
      floatingActionButton: Observer(
        builder: (context) => InkWell(
          onTap: viewStore.currentView == HViewType.notes
              ? () {
                  // TODO(BRANDOM): Implement logic to create a new file/note
                }
              : () async {
                  if (_fmStore.defaultFolder == null) {
                    await selectDefaultFolder(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: DNDark.mainColor,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Folder name'),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 30,
                                child: TextField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: TextStyle(
                                      color: DNDark.white.withOpacity(.5),
                                    ),
                                  ),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  FM.createFolder(_controller.text);
                                },
                                child: const Text('Create'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).then((value) => _controller.text = '');
                  }
                },
          onLongPress: viewStore.currentView == HViewType.notes
              ? () {
                  // TODO(BRANDOM): Implement logic
                }
              : () async => await selectDefaultFolder(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Theme.of(context).primaryColor,
            ),
            padding: const EdgeInsets.all(16),
            child: Icon(Icons.add, color: DNDark.white),
          ),
        ),
      ),
    );
  }

  Future<void> selectDefaultFolder(BuildContext context) async {
    // TODO(BRANDOM): Replace to avoid the "async gap" warning
    final folderPath = await FM.pickFolder();
    if (folderPath != null) _fmStore.defaultFolder = folderPath;
    if (_fmStore.defaultFolder == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Text(
                folderPath != null
                    ? '${basename(folderPath)} selected'
                    : 'Folder not selected, try again :|',
              ),
            ],
          ),
          showCloseIcon: true,
        ),
      );
    }
  }
}
