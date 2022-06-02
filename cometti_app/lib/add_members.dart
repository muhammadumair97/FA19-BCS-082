import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'admin.dart';
import 'model/members.dart';


class members extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
          color: Colors. black, //change your color here.
        ),
            title: const Text("Add Members"),
          centerTitle: true
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
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: idController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Group ID',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),

                child: ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    postDetailsToFirestore();
                  },
                )
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),

                child: ElevatedButton(
                  child: const Text('Back'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Admin()
                    )
                    );


                  }
                )
            ),
          ],
        ));
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
    groupModel.email  =emailController.text;
    groupModel.groupName  = nameController.text;
    groupModel.phone = phoneController.text;

    await firebaseFirestore
        .collection("amount")
        .doc(groupModel.uid)
        .set(groupModel.toMap());
    Fluttertoast.showToast(msg: "Amount Added successfully");
    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => Admin()), (route) => false);

  }




}