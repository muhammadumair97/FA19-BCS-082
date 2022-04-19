import 'package:flutter/material.dart';
import 'screen1.dart';


class Screen2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('screen 2'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text('Go back to Screen 1'),
          onPressed:() {
            Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => Screen1()),
            );
          },
        ),
      ),

    );
  }
}