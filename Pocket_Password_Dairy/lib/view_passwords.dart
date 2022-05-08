import 'package:flutter/material.dart';


class viewpassword extends StatefulWidget {
  @override
  _viewpasswordState createState() => _viewpasswordState();
}

class _viewpasswordState extends State<viewpassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('View All PAssword'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                child: Text('View password', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                child: Text('Edit Password ', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
          ]
          ))
      ),
    );
  }
}