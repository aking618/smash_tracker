import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smash_tracker/pages/home.dart';
import 'package:smash_tracker/pages/player_card.dart';
import 'package:smash_tracker/services/add_dropdown_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/playerCard': (context) => PlayerCard(),
        '/addPlayer': (context) => AddPlayer(),
      },
    ));
}

