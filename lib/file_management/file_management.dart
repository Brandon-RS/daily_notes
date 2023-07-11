import 'dart:io';
import 'dart:math';

import 'package:daily_notes/file_management/store/fm.store.dart';
import 'package:daily_notes/locator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class FM {
  static final _fmStore = locator<FMStore>();

  static Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      print(result.files.first.name);
    } else {
      // User canceled the picker
    }
  }

  static Future<void> pickLocalFile() async {
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

  static Future<String?> pickFolder() async {
    return await FilePicker.platform.getDirectoryPath();
  }

  static void readFolderDirectories() async {
    if (_fmStore.defaultFolder == null) {
      return;
    }

    Directory directory = Directory(_fmStore.defaultFolder!);

    if (directory.existsSync()) {
      List<Directory> subDirectories =
          directory.listSync().whereType<Directory>().toList();

      for (Directory subDirectory in subDirectories) {
        print(subDirectory.path);
      }
    }
  }

  static Future<void> createFolder(String name) async {
    Directory newFolder = Directory('${_fmStore.defaultFolder}/$name');
    if (!await newFolder.exists()) {
      await newFolder.create();
      _fmStore.successMessage = 'Folder created successfully';
    } else {
      _fmStore.errorMessage = 'Folder already exists';
    }
  }

  static void createFile(String folderPath, String fileName) {
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

  static Future<void> createFileChoosingFolder() async {
    final result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      Random random = Random();
      int i = random.nextInt(15);
      createFile(result, 'file$i.txt');
      setTextToFile(result, 'file$i.txt', generateRandomString(30));
    }
  }

  static String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  static void setTextToFile(String folderPath, String fileName, String text) {
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
}
