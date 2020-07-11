import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:smash_tracker/models/player_model.dart';

Player player;

Future<String> _loadingAPlayerAsset (String playerName) async {
  return await rootBundle.loadString('assets/$playerName.json');
}

Future loadPlayer (String playerName) async {
  String jsonString = await _loadingAPlayerAsset(playerName);
  final jsonResponse = jsonDecode(jsonString);
  player = new Player.fromJson(jsonResponse);
}

Future<Player> getPlayer(String playerName) async {
  print('before loadPlayer');
  await loadPlayer(playerName);
  print('after loadPlayer');
  print(player.playerId);
  return player;
}