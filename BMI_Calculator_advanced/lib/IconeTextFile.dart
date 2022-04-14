import 'package:bmi_calculator/ConstantFile.dart';
import 'package:flutter/material.dart';
import 'ContainerFile.dart';
class RepeatTextandICONeWidget extends StatelessWidget {
  RepeatTextandICONeWidget({@required this.iconData,this.Label});
  final IconData iconData;
  final String Label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
        Icon(
          iconData,
          size: 85.0,

        ),
        SizedBox(
          height:15.0,
        ),
        Text(Label,style:kLabelStyle,),
      ],


    );
  }
}