import 'package:flutter/material.dart';
import 'package:lab_final_project/manager/signup.dart';

import 'adminlogin.dart';

class forget extends StatefulWidget {
  const forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _homeState();
}

class _homeState extends State<forget> {

  // form key
  final _formKey =GlobalKey<FormState>();


  //text editing controller
  TextEditingController institutionController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    //institution field
    final institutionField = TextFormField(
        autofocus: false,
        controller: institutionController,
        keyboardType: TextInputType.name,

        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Institution name can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid  institution name (min. 3 characters)");
          }
          return null;

        },
        onSaved: (value){

          institutionController.text = value!;

        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Institution name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));


    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,

        validator: (value) {

          RegExp regex = RegExp(r'^.{8,}$');
          if(value!.isEmpty)
          {
            return("Password field should not be empty");
          }
          if(!regex.hasMatch(value)){
            return ("Please Enter Valid Password(Min. 8 characters");
          }
        },

        onSaved: (value){
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "New Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        )
    );


    //Submit button
    final SubmitButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,



        onPressed: () {
          adminlogin();
        },

        child: Text("Submit" , textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),

    );


    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(

          child: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),

                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children:<Widget>[

                          SizedBox(height: 15),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Create New Password",


                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight:FontWeight.bold,
                                      fontSize: 20 ),
                                ),
                              ]
                          ),
                          SizedBox(height: 45),
                          institutionField,
                          SizedBox(height: 25),
                          passwordField,
                          SizedBox(height: 35),
                          SubmitButton,




                        ],

                      ),
                    ),
                  )
              )
          )

      ),
    );

  }



}



