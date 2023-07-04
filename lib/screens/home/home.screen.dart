import 'dart:io';

import 'package:daily_notes/constants/color.constants.dart';
import 'package:daily_notes/file_management/file_management.dart';
import 'package:daily_notes/file_management/store/fm.store.dart';
import 'package:daily_notes/locator.dart';
import 'package:daily_notes/preferences/preferences.dart';
import 'package:daily_notes/screens/home/helpers/view_type.dart';
import 'package:daily_notes/screens/home/store/home_view.store.dart';
import 'package:daily_notes/screens/home/widgets/home.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path/path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewStore = locator<HomeViewStore>();
    final fmStore = locator<FMStore>();
    final prefs = Preferences();
    final size = MediaQuery.of(context).size;
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
                  if (fmStore.getDefaultFolder == null) {
                    await selectDefaultFolder(context, prefs: prefs);
                  }
                },
          onLongPress: () async {
            await selectDefaultFolder(context, prefs: prefs);
          },
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

  Future<void> selectDefaultFolder(
    BuildContext context, {
    required Preferences prefs,
  }) async {
    // TODO(BRANDOM): Implement reactions to avoid the "async gap" warning
    final folderPath = await FM.pickFolder();
    if (folderPath != null) prefs.defaultFolderPath = folderPath;
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
