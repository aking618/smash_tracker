import 'dart:async'show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:smash_tracker/models/playerlist_model.dart';

PlayerList playerList;

Future<String> _loadPlayerListAsset () async {
  return await rootBundle.loadString('assets/nebula.json');
}

Future loadPlayerList () async {
  String jsonString = await _loadPlayerListAsset();
  final jsonResponse = jsonDecode(jsonString);
  playerList = PlayerList.fromJson(jsonResponse);
}

Future<PlayerList> getPlayerList() async {
  await loadPlayerList();
  return playerList;
}