import 'package:flutter/material.dart';
import 'package:smash_tracker/models/player_model.dart';
import 'package:smash_tracker/services/player_services.dart';

// ignore: must_be_immutable
class PlayerListTile extends StatefulWidget {

  final Function delete;
  final Function edit;
  final String playerName;

  PlayerListTile({
    this.delete,
    this.edit,
    this.playerName
  });

  @override
  _PlayerListTileState createState() => _PlayerListTileState();
}

class _PlayerListTileState extends State<PlayerListTile> {
  Player player;

  void loadPlayer (String playerName) async {
    print('before getPlayer');
    this.player = await getPlayer(playerName);
  }


  @override
  Widget build(BuildContext context) {

    void loadPlayerCard() async {
      Navigator.pushNamed(context, '/playerCard', arguments: player);
    }

    loadPlayer('neubla');

    if(player.playerChars.char2.isEmpty) {
      return Card(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            onTap: () async{loadPlayerCard();},
            leading: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://raw.githubusercontent.com/marcrd/smash-ultimate-assets/'
                          'master/stock-icons/png/${player.playerChars.char1}.png'
                  ),
                  backgroundColor: Colors.grey[850],
                  radius: 15.0,
                ),
              ],
            ),
            title: Text(player.playerId),
            subtitle: Text(player.playerSetCount),
            trailing: Row(
              children: <Widget>[
                IconButton(
                  onPressed: widget.edit,
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: widget.delete,
                  icon: Icon(Icons.delete_outline),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Card(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://raw.githubusercontent.com/marcrd/smash-ultimate-assets/'
                        'master/stock-icons/png/${player.playerChars.char1}.png'
                ),
                backgroundColor: Colors.grey[850],
                radius: 15.0,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://raw.githubusercontent.com/marcrd/smash-ultimate-assets/'
                        'master/stock-icons/png/${player.playerChars.char2}.png'
                ),
                backgroundColor: Colors.grey[850],
                radius: 15.0,
              ),
            ],
          ),
          title: Text(player.playerId),
          subtitle: Text(player.playerSetCount),
          trailing: Row(
            children: <Widget>[
              IconButton(
                onPressed: widget.edit,
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: widget.delete,
                icon: Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
