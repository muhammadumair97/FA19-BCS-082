import 'package:flutter/material.dart';



class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller

  TextEditingController institutionNameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    //institution field
    final institutionNameField = TextFormField(
        autofocus: false,
        controller: institutionNameEditingController,
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
        onSaved: (value) {
          institutionNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Institution Name ",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter your Email";
          }

          // reg expressions for email validations
          if (!RegExp("^[a-zA-Z0-9+_.]+@[a-z]+.[a-z]").hasMatch(
              value)) {
            return ("Please enter a valid Email");
          };
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email ",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

    //phone  field
    final phoneField = TextFormField(
        autofocus: false,
        controller: phoneEditingController,
        keyboardType: TextInputType.name,

        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter your phone number";
          }

          // reg expressions for email validations
          if (!RegExp("^[0-9]{11}").hasMatch(
              value)) {
            return ("Please enter a valid phone 03xx-xxxxxxx");
          };
          return null;
        },
        // validator
        onSaved: (value) {
          phoneEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Phone Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

    //Password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{8,}$');
          if (value!.isEmpty) {
            return ("Password field should not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Please Enter Valid Password(Min. 8 characters");
          }
        },

        onSaved: (value) {
          institutionNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));


    //signup button
    final signupButton = Material(
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
        },
        child: Text("Signup", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),

    );


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),

          // back to login form
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(

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

                          children: <Widget>[
                            SizedBox(height: 15),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Admin Signup",


                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight:FontWeight.bold,
                                        fontSize: 30 ),
                                  ),
                                ]
                            ),
                            SizedBox(
                                height: 120,
                                child: Image.asset("images/images (4).jpg",
                                  fit: BoxFit.contain,
                                )
                            ),
                            SizedBox(height: 45),
                            institutionNameField,
                            SizedBox(height: 20),
                            emailField,
                            SizedBox(height: 20),
                            phoneField,
                            SizedBox(height: 20),
                            passwordField,
                            SizedBox(height: 20),
                            signupButton,
                            SizedBox(height: 15),


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











