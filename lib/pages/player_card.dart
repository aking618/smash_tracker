import 'package:flutter/material.dart';
import 'package:smash_tracker/models/player_model.dart';
import 'package:smash_tracker/models/playerlist_model.dart';
import 'package:smash_tracker/services/json_storage_services.dart';
import 'package:smash_tracker/services/player_services.dart';

class PlayerCard extends StatefulWidget {

  PlayerCard({Key key}) : super (key: key);

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {

  int winCount;
  int loseCount;

  void getWinLoseCount(Player player) {

    List<String> setCount = player.playerSetCount.split(" - ");

    String win = setCount[0];
    String lose = setCount[1];

    setState(() {
      winCount = int.parse(win);
      loseCount = int.parse(lose);
    });
  }

  void incrementCounts (PlayerList playerList, int index, Player player, String type) {
    if (type == 'win') {
      setState(() {
        winCount += 1;
        playerList.players[index].playerSetCount = "$winCount - $loseCount";
      });

    } else {
      setState(() {
        loseCount += 1;
        playerList.players[index].playerSetCount = "$winCount - $loseCount";
      });

      writePlayerData(playerList);
    }


    print(PlayerListtoJson(playerList));
    print(player.playerSetCount);
  }

  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context).settings.arguments;
    Player player = data['player'];
    PlayerList playerList = data['playerList'];
    int index = data['index'];

    setState(() {
      getWinLoseCount(player);
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Text('WIN'),
              onPressed: () {
                incrementCounts(playerList, index, player, 'win');
              },
              backgroundColor: Colors.grey[800],
              heroTag: null,
            ),
            SizedBox(width: 15.0,),
            FloatingActionButton(
              child: Text('LOSE'),
              onPressed: () {},
              backgroundColor: Colors.grey[800],
              heroTag: null,
            ),
            SizedBox(width: 15.0,),
            FloatingActionButton(
              child: Text('RESET'),
              onPressed: () {},
              backgroundColor: Colors.grey[800],
              heroTag: null,
            ),
          ],
        ),
        body: Padding(
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
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                player.playerId,
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0,),
              Text(
                'CURRENT SET COUNT',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                player.playerSetCount,
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0,),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_comment),
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 10.0,),
                  Flexible(
                    child: TextField(
                      controller: TextEditingController()..text = player.playerNotes,
                      scrollPadding: EdgeInsets.all(10.0),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ENTER NOTES HERE'
                      ),
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
                'https://raw.githubusercontent.com/marcrd/smash-ultimate-assets/'
                'master/stock-icons/png/${player.playerChars.char1}.png'
              ),
            backgroundColor: Colors.grey[850],
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
              'https://raw.githubusercontent.com/marcrd/smash-ultimate-assets/'
                  'master/stock-icons/png/${player.playerChars.char1}.png'
          ),
          backgroundColor: Colors.grey[850],
          radius: 70.0,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://raw.githubusercontent.com/marcrd/smash-ultimate-assets/'
                  'master/stock-icons/png/${player.playerChars.char2}.png'
          ),
          backgroundColor: Colors.grey[850],
          radius: 70.0,
        ),
      ],
    );
  }

}
