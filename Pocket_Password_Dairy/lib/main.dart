 import 'package:flutter/material.dart';
import 'package:pocket_password_dairy/utilities/routes.dart';
 import 'home_page.dart';
 import 'simple_password.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: HomePage(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
        darkTheme: ThemeData(
          primarySwatch:Colors.green,
        ),
      routes: {
       MyRoutes.Simplepassword:(context) => simplepassword(),
      },
      );

  }
}
