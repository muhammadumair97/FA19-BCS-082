import 'package:flutter/material.dart';
import 'add_amount.dart';
import 'add_members.dart';
import 'view_all_members.dart';
import 'create_new_group.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors. black, //change your color here.
            ),
            title: const Text("Admin"),
            centerTitle: true,
        ),
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
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
            child: Row(
              // for ADD members
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 SizedBox(
                   child: ElevatedButton(
                      child:Text(
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
                ),
                 )
              ],
            ),
    ),
    Padding(
    padding: const EdgeInsets.all(20.0),
            child: Row(
              // for adding amount
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: ElevatedButton(
                      child:Text(
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
                  ),
                )
              ],
            ),
    ),

        Padding(
          padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: ElevatedButton(
                      child:  Text(
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
                  ),
                )
              ],
            ),

        ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: ElevatedButton(
                      child: Text(
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
                  ),
                )
              ],
            ),
        )],
        ));
  }
}