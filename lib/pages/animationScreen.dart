import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>AnimationState();

}

class AnimationState extends State<AnimationScreen>  with SingleTickerProviderStateMixin{
  AnimationController _controller ;
  Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(vsync: this,duration: new Duration(milliseconds: 2000));
    _animation = new Tween(begin: 0.0,end: 300.0).animate(new CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.addListener(() {
      if(_controller.isCompleted)
        _controller.reverse();
      else if(_controller.isDismissed)
        _controller.forward();

    });
  }
  Widget _animationBuilder(BuildContext context,Widget child){
    return new Container(
      height: _animation.value,
      width: _animation.value,
      child: FlutterLogo(),
    );

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
      child:   new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new AnimatedBuilder(animation: _controller, builder: _animationBuilder),

          new RaisedButton(onPressed: (){
             _controller.forward();
          },child: new Text("Run"),)
        ],
      ),
      ),
    );
  }

}