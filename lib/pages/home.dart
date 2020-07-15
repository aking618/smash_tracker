import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smash_tracker/models/character_model.dart';
import 'package:smash_tracker/models/player_model.dart';
import 'package:smash_tracker/models/playerlist_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PlayerList playerList;

//   void loadPlayerCard (String playerName) async {
//    print('before getPlayer');
//    Player player = await getPlayer(playerName);
//    print("after getPlayer");
//    print(player.playerId);
//    //players.add(player);
//
//    Navigator.pushNamed(context, '/playerCard', arguments: player);
//  }

  void loadPlayerCard(String playerName) {
    Characters char = Characters('link', 'zelda');
    Player player = Player('Ayren', '9 - 3', char, "");
    print(player.toJson());
  }

  @override
  void initState() {
    super.initState();
    playerList =  ModalRoute.of(context).settings.arguments;
  }

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
        child: testAssetJsons(),
      ),
    );
  }


    Widget testAssetJsons() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton.icon(
            onPressed: ()async{loadPlayerCard('nebula');},
            icon: Icon(Icons.touch_app),
            label: Text('Nebula'),
          ),
          RaisedButton.icon(
            onPressed: ()async{loadPlayerCard('quiet');},
            icon: Icon(Icons.touch_app),
            label: Text('Quiet'),
          ),
          RaisedButton.icon(
            onPressed: ()async{loadPlayerCard('kambo');},
            icon: Icon(Icons.touch_app),
            label: Text('Kambo'),
          ),
          RaisedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/dropDown');
            },
            icon: Icon(Icons.arrow_downward),
            label: Text('Add'),
          ),
          ListView.builder(
              itemCount: playerList.players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(playerList.players[index].playerId),
                  subtitle: Text(playerList.players[index].playerSetCount),
                );
              },
          ),
        ],
      );
    }

}
