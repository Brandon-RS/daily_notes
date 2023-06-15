import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class FoldersView extends StatefulWidget {
  const FoldersView({super.key});

  @override
  State<FoldersView> createState() => _FoldersViewState();
}

class _FoldersViewState extends State<FoldersView> {
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      print(result.files.first.name);
    } else {
      // User canceled the picker
    }
  }

  Future<void> pickLocalFile() async {
    Directory? appDirectory;

    if (Platform.isAndroid) {
      appDirectory = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      appDirectory = await getApplicationDocumentsDirectory();
    }

    if (appDirectory != null) {
      String folderName = 'NewFolder';
      Directory newFolder = Directory('${appDirectory.path}/$folderName');
      if (!await newFolder.exists()) {
        await newFolder.create();
        print('Folder created successfully');
      } else {
        print('Folder already exists');
      }

      final result = await FilePicker.platform.pickFiles(
        initialDirectory: newFolder.path,
      );

      if (result != null) {
        print(result.files.first.name);
      } else {
        // User canceled the picker
      }
    } else {
      print('Failed to get the app directory');
    }
  }

  Future<void> pickFolder() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [''],
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final folderPath = result.files.first.path!;
      print('Selected folder path: $folderPath');
    } else {
      // User canceled the picker or no folder was selected
    }
  }

  Future<void> createFolder() async {
    Directory? appDirectory;

    if (Platform.isAndroid) {
      appDirectory = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      appDirectory = await getApplicationDocumentsDirectory();
    }

    if (appDirectory != null) {
      String folderName = 'NewFolder';
      Directory newFolder = Directory('${appDirectory.path}/$folderName');
      if (!await newFolder.exists()) {
        await newFolder.create();
        print('Folder created successfully');
      } else {
        print('Folder already exists');
      }
    } else {
      print('Failed to get the app directory');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          onPressed: () {
            pickFile();
          },
          child: const Text('Pick a file'),
        ),
        FilledButton(
          onPressed: () {
            pickLocalFile();
          },
          child: const Text('Pick local file'),
        ),
        FilledButton(
          onPressed: () {
            pickFolder();
          },
          child: const Text('Pick folder'),
        ),
        FilledButton(
          onPressed: () {
            createFolder();
          },
          child: const Text('Create Folder'),
        ),
      ],
    );
  }
}
