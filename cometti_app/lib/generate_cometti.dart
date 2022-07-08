import'package:flutter/material.dart';
import 'dart:math';

class generate extends StatefulWidget {
  const generate({Key? key}) : super(key: key);

  @override
  State<generate> createState() => _generateState();
}

class _generateState extends State<generate> {
  String randomNumber = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(iconTheme: const IconThemeData(
          color: Colors. black, //change your color here.
        ),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),

            // back to login form
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Generate Cometti"),
          centerTitle: true,
        ),
        body: generatestate()
      ),
    );
  }
}

class generatestate extends StatefulWidget {
  const generatestate({Key? key}) : super(key: key);

  @override
  State<generatestate> createState() => _generatestateState();
}

class _generatestateState extends State<generatestate> {
  String randomnumber = '';


  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
// minimum number
    final minField = TextFormField(
        autofocus: false,
        controller: minController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^[0-9]{1,}$');
          if (value!.isEmpty) {
            return ("Group id can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid id (min. 1 number)");
          }
          return null;
        },
        onSaved: (value) {
          minController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Minimum Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

// maximum number
    final maxField = TextFormField(
        autofocus: false,
        controller: maxController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^[0-9]{1,}$');
          if (value!.isEmpty) {
            return ("Group id can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid id (min. 1 number)");
          }
          return null;
        },
        onSaved: (value) {
          maxController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Maximum Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));


    //generate button

    final generateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        onPressed: () {
          setState(() {
            randomnumber = (Random().nextInt(int.parse(maxController.text)) +
                (int.parse(minController.text))).toString();
            });
            },
        child: Text("Generate", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),

    );

   final textid= Text(
        'Randomly generated commetti ID  $randomnumber '
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(

          child: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),

                    child: Form(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,


                          children: <Widget>[

                            SizedBox(height: 45),
                            minField,
                            SizedBox(height: 20),
                            maxField,
                            SizedBox(height: 20),
                            generateButton,
                            SizedBox(height: 20),
                            textid,
                            SizedBox(height: 20),



                          ]

                      ),
                    ),
                  )
              )
          )

      ),
    );
  }


}
