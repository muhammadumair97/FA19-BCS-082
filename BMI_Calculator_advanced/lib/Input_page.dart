
import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('BMI Calculator')
      ),
      body: Column (
        children:  [
           Expended(child: Row(
             children:  [
               Expended(child: Container(
                 margin: EdgeInsets.all(15.0),
                 decoration: BoxDecoration(
                   color: Color(0xFF1D1E33),
                   borderRadius: BorderRadius.circular(10.0),
                 ),
               )),
               Expended(child:  Container(
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                        color: Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10.0),
    ),
    )),
             ],
           )),

          Expended(child:  Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0),
    ),
    )),


           Expended(child:  Row(
    children: [
    Expended(child:  Container(
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
    color: Color(0xFF1D1E33),
    borderRadius: BorderRadius.circular(10.0),
    ),
    )),


    Expended(child:  Container(
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
    color: Color(0xFF1D1E33),
    borderRadius: BorderRadius.circular(10.0),
    ),
    )),
    ],
    )),
        ],
      )

    );
  }
}

