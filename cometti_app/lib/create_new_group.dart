import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/group_model.dart';



class group extends StatefulWidget {

  @override
  State<group> createState() => _groupState();
}

class _groupState extends State<group> {


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
            title: const Text("Create New Cometti"),
          centerTitle: true,
        ),
        body: const creategroup(),
      ),
    );
  }
}

class creategroup extends StatefulWidget {
  const creategroup({Key? key}) : super(key: key);

  @override
  State<creategroup> createState() => _creategroupState();
}

class _creategroupState extends State<creategroup> {

  // form key
  final _formKey =GlobalKey<FormState>();

   //final _auth = FirebaseAuth.instance;


  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // group id
    final idField = TextFormField(
        autofocus: false,
        controller: idController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^[a-zA-Z0-9]{3,}$');
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

    // group name
    final groupNameField = TextFormField(
        autofocus: false,
        controller: nameController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^[a-zA-Z]{3,}$');
          if (value!.isEmpty) {
            return ("Group name can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid  Group Name (min. 3 characters)");
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


    //amount per head

    final AmountField = TextFormField(
        autofocus: false,
        controller: amountController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^[0-9]{2,}$');
          if (value!.isEmpty) {
            return ("Amount can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid Amount (min. 2 digits)");
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


    //create button
    //signup button
    final createButton = Material(
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
          creategroup(idController.text, nameController.text ,amountController.text);
        },
        child: Text("Create", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),

    );


    // back button
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
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: <Widget>[

                            SizedBox(height: 45),
                            idField,
                            SizedBox(height: 20),
                            groupNameField,
                            SizedBox(height: 20),
                            AmountField,
                            SizedBox(height: 20),
                            createButton,
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


  void creategroup( String id , String name, String amount ,) async
  {
    if (_formKey.currentState!.validate()) {

      await _auth.group(id:id, name: name, amount: amount,)
          .then((value) => {
            postDetailsToFirestore()
      }).catchError((e)
      {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  //firebase code


  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    // calling these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    GroupModel groupModel = GroupModel();

    // writing all the values
    groupModel.groupid = groupModel.groupid;
    groupModel.uid = groupModel.uid;
    groupModel.groupName = nameController.text;
    groupModel.amount = amountController.text;

    await firebaseFirestore
        .collection("groups")
        .doc(groupModel.uid)
        .set(groupModel.toMap());
    Fluttertoast.showToast(msg: "Group created Successfully");
    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => Admin()), (route) => false);

  }


}

class _auth {
  static group({required String id, required String name, required String amount}) {}
}

