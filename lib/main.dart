import 'package:flutter/material.dart';
import 'package:smash_tracker/pages/player_card.dart';
import 'package:smash_tracker/pages/home.dart';
import 'package:smash_tracker/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/playerCard': (context) => PlayerCard(),
    },
  ));
}







