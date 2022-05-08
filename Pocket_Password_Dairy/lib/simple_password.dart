
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';



class simplepassword extends StatefulWidget {
  @override
  _simplepasswordState createState() => _simplepasswordState();

}

class _simplepasswordState extends State<simplepassword> {
  final controller = TextEditingController();
  final controller1= TextEditingController();

  SnackBar? get snackBar => null;
  @override
  void dispose(){
    controller.dispose();
    controller1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title:Text("Simple Password Generator")
    ),
    body: Container(
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text (
          'Password Hint',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),
          TextField(
            controller: controller1,
            enableInteractiveSelection:false,
            decoration:InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon:IconButton(
                  icon:Icon(Icons.copy),
                  onPressed: () {

                    final data = ClipboardData(text: controller1.text);
                    Clipboard.setData(data);

                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(snackBar!);
                  },
                )
            ),

          ),



          Text (
            'Generated Password',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          TextField(
            controller: controller,
            readOnly:true,
            enableInteractiveSelection:false,
            decoration:InputDecoration(
            border: OutlineInputBorder(),
              suffixIcon:IconButton(
                icon:Icon(Icons.copy),
                onPressed: () {

                  final data = ClipboardData(text: controller.text);
                  Clipboard.setData(data);

                  ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(snackBar!);
                },
              )
          ),
          ),

          TextButton(
              child: Text('Save Generated Password'),
              onPressed: () {
             //   DatabaseReference test = FirebaseDatabase.instance.ref().child("password");
             //   test.set("hintpassword${controller1.text}password${controller.text}");
              }
          ),
          const SizedBox(height: 12),
          buildButton(),
         // const SizedBox(height: 12),
          //buildButtons(),

        ],
      )
    ),
  );

    Widget buildButton(){
      final backgroundColor=
          MaterialStateColor.resolveWith((states) => states.contains(MaterialState.pressed)? Colors.pink:Colors.blue);
      return ElevatedButton(
        style: ButtonStyle(backgroundColor: backgroundColor),
        child: Text('Generate Password'),
        onPressed:(){
          final password = generatepassword(isWithLetters:true,isWithNumbers: true, numchar: 8);
          controller.text=password as String;
      },
      );
        }
 /* Widget buildButtons(){
    final backgroundColor=
    MaterialStateColor.resolveWith((states) => states.contains(MaterialState.pressed)? Colors.pink:Colors.blue);
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: backgroundColor),
      child: Text('Save Password'),
      onPressed:(){
       // DatabaseReference test = FirebaseDatabase.instance.ref().child("password");
       // test.set("Hello Firebase${controller.text}");

        //setState(() {
      },
    );
  }
  */
}

String generatepassword( {
 required bool isWithLetters,
 required bool isWithNumbers,
  required int numchar,
}) {

  final Letters = 'abcdefghijklmnopqrstuvwxyz';
  final Numbers = '0123456789';

  String _char ='';
  _char += (isWithLetters ? Letters : '');
  _char += (isWithNumbers ? Numbers : '');

  if(_char.length == 0)
    {
      return '';
    }
  int i=0;
  String _result ="";
  while (i < numchar) {
    final indexRandom = Random.secure().nextInt(_char.length);
    _result+=_char[indexRandom];
    i++;
  }
  return _result;

 /* return  List.generate(length, (index)
  {
    final indexRandom = Random.secure().nextInt(_char.length);
    return _char[indexRandom];
  }).join('');

  */
}



