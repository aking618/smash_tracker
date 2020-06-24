import 'package:flutter/material.dart';
import 'package:smash_tracker/pages/player_card.dart';
import 'package:smash_tracker/pages/set_count_storage.dart';

void main() {
  runApp(MaterialApp(
    home: PlayerCard(setCountStorage: SetCountStorage(),),
  ));
}







