import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:smash_tracker/models/playerlist_model.dart';
import 'package:smash_tracker/services/add_dropdown_service.dart';
import 'package:smash_tracker/services/json_storage_services.dart';
import 'package:smash_tracker/services/bullet_point.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PlayerList playerList;

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

  _launchPaypalURL() async {
    const url = 'https://paypal.me/AyrenKing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchReviewURL() async {
    const url = 'https://paypal.me/AyrenKing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchPrivacyPolicyURL() async {
    const url = 'https://paypal.me/AyrenKing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
              'Smash Tracker',
            style: TextStyle(
              fontFamily: 'Smash',
              fontSize: 24.0
            )
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 174, 3, 1.0),
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                    'Smash Tracker',
                  style: TextStyle(
                    fontFamily: 'Smash',
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 174, 3, 1.0),
                ),
              ),
              ListTile(
                title: Text(
                    'About',
                  style: TextStyle(
                    fontFamily: 'Smash',
                    fontSize: 15.0,
                    color: Color.fromRGBO(77, 114, 152, 1.0),
                  ),
                ),
                onTap: () async {
                  // Show Dialog
                  await showDialog(context: context, child:
                    new AlertDialog(
                      title: new Text(
                        'About',
                        style: TextStyle(
                            fontFamily: "Smash",
                          color: Color.fromRGBO(77, 114, 152, 1.0)
                        ),
                      ),
                      content: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text(
                            "Smash Tracker v1.0",
                            style: TextStyle(
                              fontFamily: "Smash",
                              fontSize: 20.0
                            ),
                          ),
                          new Text(
                            "Created by: Ayren King",
                            style: TextStyle(
                                fontFamily: "Smash",
                                fontSize: 15.0
                            ),
                          ),
                          new Text(
                            "ayrockstudios@gmail.com",
                            style: TextStyle(
                                fontFamily: "Smash",
                                fontSize: 15.0
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          new Text(
                            "Please review this app on the Google Play Store",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Smash",
                                fontSize: 15.0
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.all(8),
                            child: RaisedButton(
                              child: Text(
                                'Review',
                                style: TextStyle(
                                  fontFamily: "Smash",
                                ),
                              ),
                              onPressed: _launchReviewURL,
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          new Text(
                            "Privacy Policy:",
                            style: TextStyle(
                                fontFamily: "Smash",
                                fontSize: 15.0
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.all(8),
                            child: RaisedButton(
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  fontFamily: "Smash",
                                ),
                              ),
                              onPressed: _launchPrivacyPolicyURL,
                            ),
                          ),
                        ],
                      )
                    )
                  );
                  // Close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Help',
                  style: TextStyle(
                    fontFamily: 'Smash',
                    fontSize: 15.0,
                    color: Color.fromRGBO(77, 114, 152, 1.0),
                  ),
                ),
                onTap: () async {
                  // Show Dialog
                  await showDialog(context: context, child:
                  new AlertDialog(
                    title: new Text(
                      'Help',
                      style: TextStyle(
                        fontFamily: "Smash",
                        color: Color.fromRGBO(77, 114, 152, 1.0),
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          'Home Page',
                          style: TextStyle(fontFamily: "Smash"),
                        ),
                        DottedText(
                          "Tap the plus icon to add players",
                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
                        ),
                        DottedText(
                          'All players added are visible',
                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
                        ),
                        DottedText(
                          "Tap the player to go to that specific player's card",
                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
                        ),
//                        DottedText(
//                          "Edit Icon (Tap to edit the player tag or player characters",
//                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
//                        ),
                        DottedText(
                          "Delete Icon (Tap to remove player from list)",
                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
                        ),
                        SizedBox(height: 15.0,),
                        new Text(
                          'Add Player Page',
                          style: TextStyle(fontFamily: "Smash"),
                        ),
                        DottedText(
                          'Type desired player tag',
                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
                        ),
                        DottedText(
                          "Choose player characters (Only one character is required)",
                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
                        ),
                        SizedBox(height: 15.0,),
                        new Text(
                          'Player Card Page',
                          style: TextStyle(fontFamily: "Smash"),
                        ),
                        DottedText(
                          "NOTES (type player notes by tapping the text line)",
                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
                        ),
                        DottedText(
                          'WIN (increase win count)',
                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
                        ),
                        DottedText(
                          "LOSE (increase lose count)",
                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
                        ),
                        DottedText(
                          "RESET (reset win/lose count)",
                          style: TextStyle(fontFamily: "Smash", fontSize: 13.0),
                        ),
                      ],
                    ),
                  )
                  );
                  // Close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Support the Developer',
                  style: TextStyle(
                    fontFamily: 'Smash',
                    fontSize: 15.0,
                    color: Color.fromRGBO(77, 114, 152, 1.0),
                  ),
                ),
                onTap: () async {
                  // Show Dialog
                  await showDialog(context: context, child:
                  new AlertDialog(
                    title: new Text(
                      'Support the Developer',
                      style: TextStyle(
                        fontFamily: "Smash",
                        color: Color.fromRGBO(77, 114, 152, 1.0),
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          'If you want to support the developer, please use the button.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Smash",
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.all(8),
                          child: RaisedButton(
                            child: Text(
                              'Support the Developer',
                              style: TextStyle(
                                fontFamily: "Smash",
                              ),
                            ),
                            onPressed: _launchPaypalURL,
                          ),
                        ),
                      ],
                    ),
                  )
                  );
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
          backgroundColor: Color.fromRGBO(219, 22, 47, 1.0),
        ),
        body: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            color: Colors.white,
            shadowColor: Colors.black87,
            child: ListView.builder(
              itemCount: playerList.players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  //leading: characterIcons(playerList.players[index]),
                  title: Text(
                    playerList.players[index].playerId,
                    style: TextStyle(
                      fontFamily: 'Smash',
                      letterSpacing: 2.0,
                      color: Color.fromRGBO(77, 114, 152, 1.0),
                    ),
                  ),
                  subtitle: Text(
                    playerList.players[index].playerSetCount,
                    style: TextStyle(
                      fontFamily: 'Smash',
                      letterSpacing: 2.0,
                      color: Color.fromRGBO(77, 114, 152, 1.0)
                    ),
                  ),
                  onTap: () async {
                    loadPlayerCard(index);
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
//                      IconButton(
//                        onPressed: () {},
//                        icon: Icon(Icons.edit),
//                      ),
                      IconButton(
                        onPressed: () async {
                          removePlayer(index);
                          PlayerList newPlayerList = await readPlayerData();
                          setState(()  {
                            playerList = newPlayerList;
                          });
                          },
                        icon: Icon(Icons.delete_outline),
                        color: Colors.black,
                      ),
                    ],
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
