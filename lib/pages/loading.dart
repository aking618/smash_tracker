import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smash_tracker/models/playerlist_model.dart';
import 'package:smash_tracker/services/json_storage_services.dart';

import 'home.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupHomePage() async {
    PlayerList playerList = await readPlayerData();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
        settings: RouteSettings(
          arguments: playerList,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setupHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 80.0,

        ),
      ),
    );
  }
}
