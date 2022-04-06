import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aboutUS extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          //Update Color latter on
          backgroundColor: Colors.red[900],
          leading: Icon(Icons.arrow_back_ios,
            color: Colors.white,
          ),
          titleSpacing: 0,
          title: Text('Back'),
          actions: [
            Padding(padding: EdgeInsets.only(right:15,),
                child:Icon(Icons.home)
            ),
          ],
        ),
        //Body
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            ),

            Container(
                child: const Text('Contact Us Now!',
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 2.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),)
            ),

            //for padding
            SizedBox(
              height: 40,
            ),

            Container(
              padding: EdgeInsets.fromLTRB(30, 14, 0, 0),
              width: 400,
              height: 50,
              child: Text('Email',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              padding: EdgeInsets.fromLTRB(30, 14, 0, 0),
              width: 400,
              height: 50,
              child: Text('Message',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),

            SizedBox(
              height: 40,
            ),

            Container(
              width: 300,
              height: 50,

              padding: EdgeInsets.fromLTRB(120, 12, 0, 0),

              child: Text('Send Message',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),

              decoration: BoxDecoration(
                  color:Colors.red[900],
                  border: Border.all(
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),

            SizedBox(
              height: 25,
            ),

            Container(
              child: Text('_____________________Contact US___________________',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white
                ),
              ),
            ),
          ],
        )
    );
  }
}

