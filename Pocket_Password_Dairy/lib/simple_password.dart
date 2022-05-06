import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class simplepassword extends StatefulWidget {
  @override
  _simplepasswordState createState() => _simplepasswordState();

}

class _simplepasswordState extends State<simplepassword> {
  final controller = TextEditingController();

  SnackBar? get snackBar => null;
  @override
  void dispose(){
    controller.dispose();
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
          'Password hint:   abcd1234',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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

                  final sackBar =SnackBar(
                    content: Text(
                      'Password Copied',
                          style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  backgroundColor: Colors.pink,
                  );
                  ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(snackBar!);
                },
              )
          ),
          ),

          const SizedBox(height: 12),
          buildButton(),

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
          final password = generatepassword();
          controller.text=password as String;
      },
      );
        }



String generatepassword( {
  bool hasLetters = true,
  bool hasNumbers = true,
}) {
  final length = 8;
  final Letters = 'abcdefghijklmnopqrstuvwxyz';
  final Numbers = '0123456789';

  String char ='';
 if (hasLetters) char += '$Letters';
 if (hasNumbers) char += '$Numbers';

  return  List.generate(length, (index)
  {
    final indexRandom = Random.secure().nextInt(char.length);
    return char[indexRandom];
  }).join('');
}
}


