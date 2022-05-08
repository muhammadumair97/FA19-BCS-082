 import 'package:flutter/material.dart';
import 'utilities/routes.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pocket Password Diary"),
      ),
      body: Center(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.Simplepassword);
                },
                child: Text(
                    "Create Simple Password",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              ),

                Expanded(
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, MyRoutes.Toughpassword);
                    },
                    child: Text(
                        "Create Tough Password",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),

                  ),
                ),

                Expanded(
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, MyRoutes.Viewpassword);
                    },
                    child: Text(
                        "View All Passwords",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

              ],
            ),
        ),
      ),
        drawer: Drawer(
          child: ListView(
              padding: EdgeInsets.zero,
              children: const <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Muhammad Umair"),
                  accountEmail: Text("FA19-BCS-082"),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "")
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text("Email"),
                  subtitle: Text("umairaltaf727@gmail.com"),
                  trailing: Icon(Icons.send),

                ),


                ListTile(
                  leading: Icon(Icons.feedback_outlined),
                  title: Text("Feedback"),
                  subtitle: Text("just do it"),
                  trailing: Icon(Icons.send),

                ),


                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("About Us"),
                  subtitle: Text("-----------"),
                  trailing: Icon(Icons.send),

                ),
              ]

          ),

        )
    );
  }
}
