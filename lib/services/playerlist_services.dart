import 'dart:async'show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:smash_tracker/models/playerlist_model.dart';

PlayerList playerList;

Future<String> _loadPlayerListAsset () async {
  print("before return rootBundle");
  return await rootBundle.loadString('assets/nebula.json');
}

Future loadPlayerList () async {
  print("before loadstarts");
  String jsonString = await _loadPlayerListAsset();
  print(jsonString);
  final jsonResponse = jsonDecode(jsonString);
  print(jsonResponse);
  playerList = PlayerList.fromJson(jsonResponse);
}

Future<PlayerList> getPlayerList() async {
  print('before loadPlayerList');
  await loadPlayerList();
  print(playerList.toString());
  return playerList;
}