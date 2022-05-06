 import 'package:flutter/material.dart';

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
                },
                child: Text(
                    "Create Simple Password"
                ),
              ),
              ),

                Expanded(
                  child: TextButton(
                    onPressed: (){
                    },
                    child: Text(
                        "Create Tough Password"
                    ),
                  ),
                ),

                Expanded(
                  child: TextButton(
                    onPressed: (){
                    },
                    child: Text(
                        "View All Passwords"
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
                          "https://www.google.com/url?sa=i&url=http%3A%2F%2Fzhongfeiqiao.com%2FStationery%2Fgoodslist%2Fid%2F760.html&psig=AOvVaw0QavG1__8hRc4AiSQhR5_V&ust=1651902075277000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCMCHlviUyvcCFQAAAAAdAAAAABAD")
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
