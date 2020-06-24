import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smash_tracker/pages/set_count_storage.dart';

class PlayerCard extends StatefulWidget {
  final SetCountStorage setCountStorage;

  PlayerCard({Key key, @required this.setCountStorage}) : super (key: key);

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {

  int winCount;
  int loseCount;

  @override
  void initState() {
    super.initState();
    widget.setCountStorage.readSetCount().then((value) {
      setState(() {
        winCount = value;
      });
    });
  }

  Future<File> _incrementWin() {
    setState(() {
      winCount++;
    });

    return widget.setCountStorage.writeSetCount(winCount);
  }

  Future<File> _resetCounters() {
    setState(() {
      winCount = 0;
      loseCount = 0;
    });

    return widget.setCountStorage.writeSetCount(winCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Player ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Text('WIN'),
            onPressed: _incrementWin,
            backgroundColor: Colors.grey[800],
            heroTag: null,
          ),
          SizedBox(width: 15.0,),
          FloatingActionButton(
            child: Text('LOSE'),
            onPressed: () {
              setState(() {
                loseCount += 1;
              });
            },
            backgroundColor: Colors.grey[800],
            heroTag: null,
          ),
          SizedBox(width: 15.0,),
          FloatingActionButton(
            child: Text('RESET'),
            onPressed: _resetCounters,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://raw.githubusercontent.com/marcrd/smash-ultimate-assets/master/stock-icons/png/mario.png'),
                      backgroundColor: Colors.grey[850],
                      radius: 70.0,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://raw.githubusercontent.com/marcrd/smash-ultimate-assets/master/stock-icons/png/peach.png'),
                      backgroundColor: Colors.grey[850],
                      radius: 70.0,
                    ),
                  ],
                )
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
              'Nebula',
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
              '$winCount - $loseCount',
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
    );
  }
}
