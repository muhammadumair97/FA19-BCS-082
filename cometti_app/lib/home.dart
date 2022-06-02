

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/signup.dart';

import 'admin.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  // form key
  final _formKey =GlobalKey<FormState>();


  //text editing controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      validator: (value) {
        if(value!.isEmpty)
          {
           return "Please Enter your Email";
          }

        // reg expressions for email validations
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]").hasMatch(value))
        {
          return ("Please enter a valid Email");
        };
        return null;

      },
      onSaved: (value){

        emailController.text = value!;

      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
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
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        )
    );


    //login button
    final loginButton = Material(
      elevation: 5,
        borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed: (){
          signIn(emailController.text, passwordController.text);

        },

        child: Text("Login" , textAlign: TextAlign.center,
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

                        SizedBox(
                          height: 200,
                          child: Image.asset("images/logo1.png",
                          fit: BoxFit.contain,
                        )
                        ),
                        SizedBox(height: 45),
                        emailField,
                        SizedBox(height: 25),
                        passwordField,
                        SizedBox(height: 35),
                        loginButton,
                        SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Dont have an Account?"),
                          GestureDetector(

                            onTap:() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => signup()));

                          },
                            child: Text("SignUp",

                            style: TextStyle(
                              color: Colors.red,
                                fontWeight:FontWeight.bold,
                                fontSize: 15 ),
                            ),
                          )


                        ],
                      )
                      ],

                    ),
                  ),
        )
                )
        )

                ),
              );

  }



  void signIn(String email, String password) async
  {
    if(_formKey.currentState!.validate())
    {
    await _auth.signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Admin())),
    }) .catchError((e)
        {
          Fluttertoast.showToast(msg: e!.message);
        });
    }
  }
}




