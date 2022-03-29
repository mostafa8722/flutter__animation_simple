
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>SplashState();

}
class SplashState extends State<SplashScreen> {
  startTimer (){
    var _duration = new Duration(seconds: 4);
    return  new Timer(_duration, navigationFunction);
  }
  navigationFunction(){
    Navigator.pushNamed(context, "/anim");
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body:
      new Stack(
        children: [
          new Center(
            child: new Column(
              children: [
                new Text("this is splash screen page ",style: TextStyle(color: Colors.white),),
                new Text("animation project",style: TextStyle(color: Colors.white),)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: new CircularProgressIndicator(

              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
        ],
      )
      ,
    );
  }

}