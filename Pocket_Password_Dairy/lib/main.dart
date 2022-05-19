 import 'package:flutter/material.dart';
import 'package:pocket_password_dairy/utilities/routes.dart';
 import 'home_page.dart';
 import 'view_passwords.dart';
 import 'simple_password.dart';
 import 'tough_password.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();




  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        MyRoutes.Toughpassword:(context) => toughpassword(),
        MyRoutes.Viewpassword:(context) => viewpassword(),
      },
      );

  }

}
// = FirebaseDatabase.instance.ref().child("password");
// test.set("Hello Firebase${variable name}");

 //setState(() {

 //complete code
//  });