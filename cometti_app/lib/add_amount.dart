import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'admin.dart';
import 'model/amount.dart';
class amount extends StatefulWidget {
  const amount({Key? key}) : super(key: key);




  @override
  State<amount> createState() => _amountState();
}

class _amountState extends State<amount> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors. black, //change your color here.
            ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),

            // back to login form
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
            title: const Text("Add Amount"),
          centerTitle: true,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  final _formKey =GlobalKey<FormState>();


  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //group id
    final idField = TextFormField(
        autofocus: false,
        controller: idController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^[a-zA-Z]{3,}$');
          if (value!.isEmpty) {
            return ("Group id can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid id (min. 3 characters)");
          }
          return null;
        },
        onSaved: (value) {
          idController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Group ID",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

    //group name
    final nameField = TextFormField(
        autofocus: false,
        controller: nameController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^[a-zA-Z]{3,}$');
          if (value!.isEmpty) {
            return ("Group name can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid group name (min. 3 characters)");
          }
          return null;
        },
        onSaved: (value) {
          nameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Group Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

    //email address
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter your Email";
          }

          // reg expressions for email validations
          if (!RegExp("^[a-zA-Z0-9+_.]+@[a-z]+.[a-z]").hasMatch(
              value)) {
            return ("Please enter a valid Email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email Address",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

    //amount
    final amountField = TextFormField(
        autofocus: false,
        controller: amountController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^[0-9]{2,}$');
          if (value!.isEmpty) {
            return ("Amount can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid Amount (min. 2 characters)");
          }
          return null;
        },
        onSaved: (value) {
          amountController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Amount",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

    //add button
    final addButton = Material(
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
          postDetailsToFirestore();
        },
        child: Text("Add", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),

    );

    //back button
    final backButton = Material(
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
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Admin()
              )
          );
        },
        child: Text("Back", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),

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
                            idField,
                            SizedBox(height: 20),
                            nameField,
                            SizedBox(height: 20),
                            emailField,
                            SizedBox(height: 20),
                            amountField,
                            SizedBox(height: 20),
                            addButton,
                            SizedBox(height: 20),
                            backButton,
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
// firebase code

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    // calling these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


    AmountModel groupModel = AmountModel();

    // writing all the values
    groupModel.groupid = groupModel.groupid;
    groupModel.uid = groupModel.uid;
    groupModel.email = emailController.text;
    groupModel.groupName = nameController.text;
    groupModel.amount = amountController.text;

    await firebaseFirestore
        .collection("amount")
        .doc(groupModel.uid)
        .set(groupModel.toMap());
    Fluttertoast.showToast(msg: "Member Added successfully");
    Navigator.pushAndRemoveUntil(
        (context), MaterialPageRoute(builder: (context) => Admin()), (
        route) => false);
  }

}
