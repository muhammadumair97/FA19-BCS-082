import 'package:flutter/material.dart';
import 'add_amount.dart';
import 'add_members.dart';
import 'view_all_members.dart';
import 'create_new_group.dart';

class admin extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(title: const Text("Admin")),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[

            Row(
              // for ADD members
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    child: const Text(
                      'Add Members',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => members()

                          )
                      );


                    }
                )
              ],
            ),


            Row(
              // for adding amount
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    child: const Text(
                      'Add Amount',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => amount()

                          )
                      );


                    }
                )
              ],
            ),




            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    child: const Text(
                      'Create New Group',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => group()

                          )
                      );

                      //signup screen
                    }
                )
              ],
            ),




            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    child: const Text(
                      'View All Members',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => view_member()

                          )
                      );

                      //signup screen
                    }
                )
              ],
            ),
          ],
        ));
  }
}