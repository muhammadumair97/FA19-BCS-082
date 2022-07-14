import 'package:flutter/material.dart';
import 'package:lab_final_project/manager/signup.dart';

class studentlogin extends StatefulWidget {
  const studentlogin({Key? key}) : super(key: key);

  @override
  State<studentlogin> createState() => _homeState();
}

class _homeState extends State<studentlogin> {

  // form key
  final _formKey =GlobalKey<FormState>();


  //text editing controller
  TextEditingController institutionController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    //email field
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
            hintText: " Student Institution name",
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



        onPressed: () {  },

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
                              child: Image.asset("images/images (5).jpg",
                                fit: BoxFit.contain,
                              )
                          ),
                          SizedBox(height: 45),
                          institutionField,
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



}



