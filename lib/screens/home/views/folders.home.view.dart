import 'dart:io';
import 'dart:math';

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
    final result = await FilePicker.platform.getDirectoryPath();

    print(result);
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

  void createFile(String folderPath, String fileName) {
    // Get the directory where the file will be created
    Directory directory = Directory(folderPath);

    // Create the directory if it doesn't exist
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    // Create the file path by combining the directory path and the file name
    String filePath = '${directory.path}/$fileName';

    // Create the file
    File file = File(filePath);
    file.createSync();
  }

  Future<void> createFileChossingFolder() async {
    final result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      Random random = Random();
      int i = random.nextInt(15);
      createFile(result, 'file$i.txt');
      setTextToFile(result, 'file$i.txt', generateRandomString(30));
    }
  }

  String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  void setTextToFile(String folderPath, String fileName, String text) {
    // Get the directory where the file exists
    Directory directory = Directory(folderPath);

    // Create the file path by combining the directory path and the file name
    String filePath = '${directory.path}/$fileName';

    // Open the file in write mode
    File file = File(filePath);
    RandomAccessFile openedFile = file.openSync(mode: FileMode.write);

    // Write the text content to the file
    openedFile.writeStringSync(text);

    // Close the file
    openedFile.closeSync();
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
        FilledButton(
          onPressed: () {
            createFileChossingFolder();
          },
          child: const Text('Create a file'),
        ),
      ],
    );
  }
}
