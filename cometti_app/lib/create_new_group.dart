import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/group_model.dart';


class group extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(iconTheme: IconThemeData(
          color: Colors. black, //change your color here.
        ),
            title: const Text("Create New Group"),
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
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(                     //    add picture  for creating new group
                  'Welcome',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),


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
                  labelText: 'Group Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: amountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount per head',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                  child: const Text('Create'),
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
    })
    )],
        ));
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