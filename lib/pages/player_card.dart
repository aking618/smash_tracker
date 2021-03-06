import 'package:flutter/material.dart';
import 'package:smash_tracker/models/player_model.dart';
import 'package:smash_tracker/models/playerlist_model.dart';
import 'package:smash_tracker/pages/home.dart';
import 'package:smash_tracker/services/json_storage_services.dart';

class PlayerCard extends StatefulWidget {

  PlayerCard({Key key}) : super (key: key);

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {

  int winCount;
  int loseCount;

  TextStyle buttonStyle = TextStyle(fontFamily: "Smash");

  TextEditingController _notesController = TextEditingController();

  void getWinLoseCount(Player player) {

    List<String> setCount = player.playerSetCount.split(" - ");

    String win = setCount[0];
    String lose = setCount[1];

    setState(() {
      winCount = int.parse(win);
      loseCount = int.parse(lose);
    });
  }

  void changeCounts (PlayerList playerList, int index, Player player, String type) {
    if (type == 'win') {
      setState(() {
        winCount += 1;
        playerList.players[index].playerSetCount = "$winCount - $loseCount";

        List<String> notes = playerList.players[index].playerNotes.split('\n');
        String combinedNotes = "";
        for (int i = 0; i < notes.length; i++) {
          if (i == notes.length - 1) {
            combinedNotes += notes[i];
          } else {
            combinedNotes += '${notes[i]}\n';
          }
        }
        combinedNotes = combinedNotes.split('\n').join('\\n');

        playerList.players[index].playerNotes = combinedNotes;
      });
    } else if (type == 'lose') {
      setState(() {
        loseCount += 1;
        playerList.players[index].playerSetCount = "$winCount - $loseCount";

        List<String> notes = playerList.players[index].playerNotes.split('\n');
        String combinedNotes = "";
        for (int i = 0; i < notes.length; i++) {
          if (i == notes.length - 1) {
            combinedNotes += notes[i];
          } else {
            combinedNotes += '${notes[i]}\n';
          }
        }
        combinedNotes = combinedNotes.split('\n').join('\\n');

        playerList.players[index].playerNotes = combinedNotes;
      });
    } else {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('Do you want to reset the set count?'),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.pop(context, false), // passing false
                  child: Text('No'),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context, true), // passing true
                  child: Text('Yes'),
                ),
              ],
            );
          }).then((exit) {
        if (exit == null)
          setState(() {
            List<String> notes = playerList.players[index].playerNotes.split('\n');
            String combinedNotes = "";
            for (int i = 0; i < notes.length; i++) {
              if (i == notes.length - 1) {
                combinedNotes += notes[i];
              } else {
                combinedNotes += '${notes[i]}\n';
              }
            }
            combinedNotes = combinedNotes.split('\n').join('\\n');

            playerList.players[index].playerNotes = combinedNotes;
          });

        if (exit) {
          setState(() {
            winCount = loseCount = 0;
            playerList.players[index].playerSetCount = "$winCount - $loseCount";

            List<String> notes = playerList.players[index].playerNotes.split('\n');
            String combinedNotes = "";
            for (int i = 0; i < notes.length; i++) {
              if (i == notes.length - 1) {
                combinedNotes += notes[i];
              } else {
                combinedNotes += '${notes[i]}\n';
              }
            }
            combinedNotes = combinedNotes.split('\n').join('\\n');

            playerList.players[index].playerNotes = combinedNotes;
          });
          writePlayerData(playerList);
        }
      });
    }
    writePlayerData(playerList);
    //print(PlayerListtoJson(playerList));
    //print(player.playerSetCount);
  }


  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context).settings.arguments;
    Player player = data['player'];
    PlayerList playerList = data['playerList'];
    int index = data['index'];

    setState(() {
      getWinLoseCount(player);
      _notesController.text = playerList.players[index].playerNotes.replaceAll('\\n', '\n');
      _notesController.selection = TextSelection.fromPosition(
          TextPosition(offset: _notesController.text.length));
      List<String> notes = playerList.players[index].playerNotes.split('\n');
      String combinedNotes = "";
      for (int i = 0; i < notes.length; i++) {
        if (i == notes.length - 1) {
          combinedNotes += notes[i];
        } else {
          combinedNotes += '${notes[i]}\n';
        }
      }
      combinedNotes = combinedNotes.split('\n').join('\\n');

      playerList.players[index].playerNotes = combinedNotes;
    });


    Future<bool> _backPress() async {
      print('Back press');
      return  Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
            (_) => false,
      );
    }

      return WillPopScope(
        onWillPop: _backPress,
        child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                child: Text('WIN', style: buttonStyle,),
                onPressed: () {
                  changeCounts(playerList, index, player, 'win');
                },
                backgroundColor: Color.fromRGBO(219, 22, 47, 1.0),
                heroTag: null,
              ),
              SizedBox(width: 15.0,),
              FloatingActionButton(
                child: Text('LOSE', style: buttonStyle,),
                onPressed: () {
                  changeCounts(playerList, index, player, 'lose');
                },
                backgroundColor: Color.fromRGBO(219, 22, 47, 1.0),
                heroTag: null,
              ),
              SizedBox(width: 15.0,),
              FloatingActionButton(
                child: Text('RESET', style: buttonStyle,),
                onPressed: () {
                  changeCounts(playerList, index, player, 'reset');
                },
                backgroundColor: Color.fromRGBO(219, 22, 47, 1.0),
                heroTag: null,
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.only(bottom: 100.0),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30.0,40.0,30.0,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                            child: characterIcons(player),
                        ),
                        Divider(
                          height: 90.0,
                          color: Colors.grey[800],
                        ),
                        Text(
                          'NAME',
                          style: TextStyle(
                            color: Color.fromRGBO(77, 144, 152, 1.0),
                            fontFamily: 'Smash',
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          player.playerId,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 174, 3, 1.0),
                            letterSpacing: 2.0,
                            fontSize: 28.0,
                            //fontFamily: 'Smash'
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        Text(
                          'CURRENT SET COUNT',
                          style: TextStyle(
                            color: Color.fromRGBO(77, 144, 152, 1.0),
                            fontFamily: 'Smash',
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          player.playerSetCount,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 174, 3, 1.0),
                            letterSpacing: 2.0,
                            fontSize: 28.0,
                            //fontFamily: 'Smash'
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        Text(
                          'NOTES',
                          style: TextStyle(
                            color: Color.fromRGBO(77, 144, 152, 1.0),
                            fontFamily: 'Smash',
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Flexible(
                          child: TextField(
                            controller: _notesController,
                            obscureText: false,
                            maxLines: null,
                            onChanged: (value) {
                              List<String> notes = value.split('\n');
                              String combinedNotes = "";
                              for (int i = 0; i < notes.length; i++) {
                                if (i == notes.length - 1) {
                                  combinedNotes += notes[i];
                                } else {
                                  combinedNotes += '${notes[i]}\n';
                                }
                              }
                              combinedNotes = combinedNotes.split('\n').join('\\n');

                              playerList.players[index].playerNotes = combinedNotes;
                              print(playerList.players[index].playerNotes.trim());
                              writePlayerData(playerList);
                            },
                            style: TextStyle(
                              color: Color.fromRGBO(255, 174, 3, 1.0),
                              letterSpacing: 2.0,
                              fontSize: 14.0,
                              //fontFamily: 'Smash'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    ),
      );
  }

  Widget characterIcons(Player player) {

    if (player.playerChars.char2.isEmpty) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/aking618/'
                      'Smash_Tracker_Icons/master/png/'
                      '${player.playerChars.char1}.png'
              ),
            backgroundColor: Color.fromRGBO(77, 144, 152, 1.0),
            radius: 70.0,
            ),
          ],
        );
      }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://raw.githubusercontent.com/aking618/'
                  'Smash_Tracker_Icons/master/png/'
                  '${player.playerChars.char1}.png'
          ),
          backgroundColor: Color.fromRGBO(77, 144, 152, 1.0),
          radius: 70.0,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://raw.githubusercontent.com/aking618/'
                  'Smash_Tracker_Icons/master/png/'
                  '${player.playerChars.char2}.png',
          ),

          backgroundColor: Color.fromRGBO(77, 144, 152, 1.0),
          radius: 70.0,
        ),
      ],
    );
  }

}
