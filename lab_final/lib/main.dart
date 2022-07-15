
import 'package:flutter/material.dart';
import 'package:lab_final_project/dashboard.dart';






void main()
{
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manager login',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const dashboard(),

    );
  }
}
