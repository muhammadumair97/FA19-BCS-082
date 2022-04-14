import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Muhammad Umair"),
            accountEmail: Text("FA19-BCS-082"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.instagram.com/p/COfMd7ThzP7/")
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("About"),
            subtitle: Text("Student of BSCS"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text("Email"),
            subtitle: Text("umairaltaf727@gmail.com"),
            trailing: Icon(Icons.send),

          ),
        ],
      ),
    );
  }
}


