import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';


class toughpassword extends StatefulWidget {
  @override
  _toughpasswordState createState() => _toughpasswordState();

}

class _toughpasswordState extends State<toughpassword> {
  final controller = TextEditingController();
  final controller1= TextEditingController();
  final controller2= TextEditingController();

  SnackBar? get snackBar => null;
  @override
  void dispose(){
    controller.dispose();
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
        title:Text("Tough Password Generator")
    ),
    body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text (
              ' Enter Password hint',
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
              'Enter length Password',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: controller2,
              enableInteractiveSelection:false,
              decoration:InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon:IconButton(
                    icon:Icon(Icons.copy),
                    onPressed: () {

                      final data = ClipboardData(text: controller2.text);
                      Clipboard.setData(data);

                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(snackBar!);
                    },
                  )
              ),
            ),


            Text (
              ' Generated Password ',
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
    bool hasULetters = true,
    bool hasspecial =true,
  }) {
    final int length =int.parse(controller2.text);
    final Letters = 'abcdefghijklmnopqrstuvwxyz';
    final ULetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final Numbers = '0123456789';
    final special = '@#=+!£\$%&?[](){}';

    String char ='';
    if (hasLetters) char += '$Letters';
    if (hasULetters) char += '$ULetters';
    if (hasNumbers) char += '$Numbers';
    if (hasspecial) char += '$special';

    return  List.generate(length, (index)
    {
      final indexRandom = Random.secure().nextInt(char.length);
      return char[indexRandom];
    }).join('');
  }
}


