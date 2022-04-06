import 'package:flutter/material.dart';
import 'about.dart';
import 'main.dart';

int num = 10;
class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.teal,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 15,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                         image: DecorationImage(
                             image: AssetImage('assets/img.png'),
                         fit: BoxFit.fill
                       )
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Quiz App",),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Total number of questions: 10',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> MyApp(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Questions remaining: 10',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> MyApp(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Correct answers: 0',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> MyApp(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Incorrect answers: 0',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: (){
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Contact US',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> aboutUS(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
