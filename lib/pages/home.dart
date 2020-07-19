import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smash_tracker/models/playerlist_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    PlayerList playerList = ModalRoute.of(context).settings.arguments;
    print("after assigning playerList");

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Smash Tracker'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'addPlayer');
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          child: Card(
            color: Colors.grey[900],
            shadowColor: Colors.black87,
            child: ListView.builder(
              itemCount: playerList.players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  //leading: characterIcons(playerList.players[index]),
                  title: Text(
                    playerList.players[index].playerId,
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  ),
                  subtitle: Text(
                    playerList.players[index].playerSetCount,
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/playerCard', arguments: playerList.players[index]);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
