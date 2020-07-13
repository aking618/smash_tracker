import 'package:flutter/material.dart';
import 'package:smash_tracker/pages/player_card.dart';
import 'package:smash_tracker/pages/home.dart';
import 'package:smash_tracker/pages/loading.dart';
import 'package:smash_tracker/services/add_dropdown_service.dart';

void main() {
  runApp(MaterialApp(
//    initialRoute: '/dropDown',
//    routes: {
//      '/': (context) => Loading(),
//      '/home': (context) => Home(),
//      '/playerCard': (context) => PlayerCard(),
//      '/dropDown': (context) => AddPlayer(),
//    },
  home: AddPlayer(),
  ));
}







