 import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pocket Password Diary"),
      ),
      body: Center(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                onPressed: (){
                },
                child: Text(
                    "Create Simple Password"
                ),
              ),
              ),

                Expanded(
                  child: TextButton(
                    onPressed: (){
                    },
                    child: Text(
                        "Create Tough Password"
                    ),
                  ),
                ),

                Expanded(
                  child: TextButton(
                    
                    onPressed: (){
                    },
                    child: Text(
                        "View All Password"
                    ),
                  ),
                ),

              ],
            ),
        ),
      ),
      drawer: Drawer(

      ),
    );
  }
}
