import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:smash_tracker/models/playerlist_model.dart';
import 'package:smash_tracker/services/playerlist_services.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  print(path);
  return File('$path/playerData.json');
}

Future<File> writePlayerData(PlayerList playerList) async {
  final file = await _localFile;
  return file.writeAsString(PlayerListtoJson(playerList));
}

Future<PlayerList> readPlayerData () async {
  try {
    final file = await _localFile;
    String contents = await file.readAsString();
    final jsonResponse = (jsonDecode(contents)); //wrap in encode
    PlayerList playerList = PlayerList.fromJson(jsonResponse);
    return playerList;
  } catch (e) {
    print(e);
    return getPlayerList(); //just loads a placeholder json in the assets folder;
  }
}