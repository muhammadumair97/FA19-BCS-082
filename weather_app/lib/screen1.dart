import 'package:flutter/material.dart';



class Screen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('screen 1'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          child: Text('Go Forwards to Screen 2'),
          onPressed:() {},
        ),
      ),

    );
  }
}