import 'package:flutter/material.dart';
import 'package:lab_final_project/student/studentlogin.dart';
import 'package:lab_final_project/teacher/teacherlogin.dart';

import 'manager/adminlogin.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {

    //admin button
    final Admin = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,



        onPressed: () {  adminlogin(); },

        child: Text("Admin Login" , textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),

    );

    //teacher button
    final teacher = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,



        onPressed: () {
          tlogin();
          },

        child: Text("Teacher Login" , textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),

    );


    // student login
    final Student = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,



        onPressed: () { student(); },

        child: Text("Student Login" , textAlign: TextAlign.center,
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

                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,

                       children:<Widget>[
                         SizedBox(height: 15),
                         Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               Text("Dashboard",


                                 style: TextStyle(
                                     color: Colors.red,
                                     fontWeight:FontWeight.bold,
                                     fontSize: 30 ),
                               ),
                             ]
                         ),

                         SizedBox(height: 45),
                         Admin,
                         SizedBox(height: 25),
                         teacher,
                         SizedBox(height: 35),
                         Student,
                         SizedBox(height: 15),

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
