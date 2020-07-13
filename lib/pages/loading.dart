import 'package:flutter/material.dart';
import 'package:smash_tracker/services/player_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupHomePage() async {
    await Future.delayed(Duration(seconds: 3), (){});
    Navigator.pushReplacementNamed(context, '/home');
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
