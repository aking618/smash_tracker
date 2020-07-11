import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smash_tracker/models/player_model.dart';
import 'package:smash_tracker/services/player_services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Player> players;

   void loadPlayerCard (String playerName) async {
    Player player = await getPlayer(playerName);
    players.add(player);

    Navigator.pushNamed(context, '/playerCard', arguments: player);
  }

//  @override
//  void initState() {
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Smash Tracker'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      body: Center(
        child: RaisedButton.icon(
            onPressed: loadPlayerCard('nebula'),
            icon: Icon(Icons.touch_app),
            label: Text('Nebula'),
        ),
      ),
    );
  }
}
