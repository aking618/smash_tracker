import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smash_tracker/models/playerlist_model.dart';
import 'package:smash_tracker/services/add_dropdown_service.dart';
import 'package:smash_tracker/services/json_storage_services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PlayerList playerList;

  void addPlayer(PlayerList playerList) async {
    final newPlayerList = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPlayer()),
    );

    print(playerList.toJson().toString());

    setState(() {
      playerList = newPlayerList;
    });
  }

  void removePlayer(PlayerList playerList, int index) async {

   playerList.players.removeAt(index);
   await writePlayerData(playerList);
  }

  @override
  void initState() {
    super.initState();
    readPlayerData().then((PlayerList list) {
      playerList = list;
    });
  }

  @override
  Widget build(BuildContext context) {

    playerList = ModalRoute.of(context).settings.arguments;
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
        onPressed: () async {addPlayer(playerList);},
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[600],
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
                  trailing: IconButton(
                    onPressed: () async {
                      removePlayer(playerList, index);
                      PlayerList newPlayerList = await readPlayerData();
                      setState(()  {
                        playerList = newPlayerList;
                      });
                      },
                    icon: Icon(Icons.delete_outline),
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
