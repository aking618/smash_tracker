import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smash_tracker/models/playerlist_model.dart';
import 'package:smash_tracker/pages/player_card.dart';
import 'package:smash_tracker/services/add_dropdown_service.dart';
import 'package:smash_tracker/services/json_storage_services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PlayerList playerList;

  ThemeData darkTheme;
  ThemeData lightTheme;

  //Todo
  // Nintendo themed colors
  // Light themed
  // Dark themed

  // Blue

  @override
  void initState() {
    super.initState();
    readPlayerData().then((PlayerList list) {
      setState(() => playerList = list);
    });
  }

  void addPlayer() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AddPlayer()),
          (_) => false,
    );
  }

  void removePlayer(int index) async {
    playerList.players.removeAt(index);
    await writePlayerData(playerList);
  }

  void loadPlayerCard(int index) async {
    Navigator.pushNamed(
      context,
      '/playerCard',
        arguments: {
          'player': playerList.players[index],
          'playerList': playerList,
          'index': index
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit Smash Tracker?'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Yes'),
            ),
          ],
        ),
      )) ?? false;
    }

    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Smash Tracker'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Smash Tracker'),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  // Do Stuff

                  // Close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Feedback'),
                onTap: () {
                  // Do Stuff

                  // Close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  // Do Stuff

                  // Close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Support the Dev'),
                onTap: () {
                  // Do Stuff

                  // Close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {addPlayer();},
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
                    onTap: () async {
                      loadPlayerCard(index);
                    },
                    trailing: IconButton(
                      onPressed: () async {
                        removePlayer(index);
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
      ),
    );
  }

}
