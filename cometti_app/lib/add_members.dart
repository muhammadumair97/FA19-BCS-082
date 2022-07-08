import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'admin.dart';
import 'model/members.dart';


class members extends StatefulWidget {
  const members({Key? key}) : super(key: key);




  @override
  State<members> createState() => _membersState();

  getUsersList() {}
}

class _membersState extends State<members> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(
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
            title: const Text("Add Members"),
          centerTitle: true
        ),
        body: const addmembers(),
      ),
    );
  }
}

class addmembers extends StatefulWidget {
  const addmembers({Key? key}) : super(key: key);

  @override
  State<addmembers> createState() => _addmembersState();
}

class _addmembersState extends State<addmembers> {



  // form key
  final _formKey =GlobalKey<FormState>();




  TextEditingController idgController = TextEditingController();
  TextEditingController mnameController = TextEditingController();
  TextEditingController memailController = TextEditingController();
  TextEditingController mphoneController = TextEditingController();
  
  List UserProfileList =[];
  

  @override
  
  void initState(){
    super.initState();
    fetchDatabaseList();
  }
  fetchDatabaseList() async{
    
    dynamic resultant = await members().getUsersList();
    if(resultant == null){
      print ('unable to retrieve');
    } 
    else{
      setState((){
        UserProfileList = resultant;
        
      });
     
    }
    
  }
  
  Widget build(BuildContext context) {


    //group id
    final idField = TextFormField(
        autofocus: false,
        controller: idgController,
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
          idgController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.account_circle),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Group ID",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

    //member name
    final nameField = TextFormField(
        autofocus: false,
        controller: mnameController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^[a-zA-Z]{3,}$');
          if (value!.isEmpty) {
            return ("member name can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid member name (min. 3 characters)");
          }
          return null;
        },
        onSaved: (value) {
          mnameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.account_circle),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Member Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

    //email address
    final emailField = TextFormField(
        autofocus: false,
        controller: memailController,
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
          memailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: " Member Email Address",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ));

    //phone number
    final phoneField = TextFormField(
        autofocus: false,
        controller: mphoneController,
        keyboardType: TextInputType.phone,
        validator: (value) {
          RegExp regex = RegExp(r'^[0-9]{11,12}$');
          if (value!.isEmpty) {
            return ("Phone number can not be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid Ph. No. (e.g  0300-1234567 0r 92300-1234567");
          }
          return null;
        },
        onSaved: (value) {
          mphoneController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.account_circle),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Phone",
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
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        onPressed: () {
          addmembers(idgController.text, mnameController.text ,memailController.text, mphoneController.text);
        },
        child: const Text("Add", textAlign: TextAlign.center,
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
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
        child: const Text("Back", textAlign: TextAlign.center,
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

                            const SizedBox(height: 45),
                            idField,
                            const SizedBox(height: 20),
                            nameField,
                            const SizedBox(height: 20),
                            emailField,
                            const SizedBox(height: 20),
                            phoneField,
                            const SizedBox(height: 20),
                            addButton,
                            const SizedBox(height: 20),
                            backButton,
                            const SizedBox(height: 20),

                          ]

                      ),
                    ),
                  )
              )
          )

      ),
    );


  }

  void addmembers( String id , String name,String email, String phone,) async
  {
    if (_formKey.currentState!.validate()) {

      await _auth.amount(id: id, name: name,email:email, phone: phone,)
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



    MemberModel groupModel = MemberModel();

    // writing all the values
    groupModel.groupid = groupModel.groupid;
    groupModel.uid = groupModel.uid;
    groupModel.email  =memailController.text;
    groupModel.groupName  = mnameController.text;
    groupModel.phone = mphoneController.text;

    await firebaseFirestore
        .collection("amount")
        .doc(groupModel.uid)
        .set(groupModel.toMap());
    Fluttertoast.showToast(msg: "Amount Added successfully");
    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => const Admin()), (route) => false);

  }

}

class _auth {
  static amount({required String id, required String name, required String email, required String phone}) {}
}