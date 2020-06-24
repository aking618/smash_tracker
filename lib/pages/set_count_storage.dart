import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class SetCountStorage {

  // Stores information on document directory of the system
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  // Creates a reference to the file location
  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/winCounter.txt');
  }

  // Writes data to the file
  Future<File> writeSetCount(int notes) async {
    final file = await _localFile;

    return file.writeAsString('$notes');
  }

  // Reads data from the file
  Future<int> readSetCount() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

}