import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                MyNewDiceApp()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreenAccent,
        child:CircleAvatar(
          radius: 20.0,
          foregroundImage: AssetImage('images/dices.jpg'),
        ),
    );
  }
}

class MyNewDiceApp extends StatefulWidget {
  @override
  _MyNewDiceAppState createState() => _MyNewDiceAppState();
}


class _MyNewDiceAppState extends State<MyNewDiceApp> {

  var dice1 = 1;
  var dice2 = 1;
  var dice3 = 1;
  var dice4 = 1;
  var a=1;
  var b=1;
  var c=1;
  var d=1;
  var count=0;
  var winner;

  void totalSumofDices() {
    setState(() {
      count = a + b + c + d;
      if(a>b&&b>c&&c>d)
        {
          winner=("dice1 having score =$a");
        }
      if(b>a&&b>c&&c>d)
      {
        winner=(" dice2 having score =$b");
      }
      if(c>a&&c>b&&c>d)
      {
        winner=(" dice3 having score =$c");
      }
      if(d>a&&d>b&&d>c)
      {
        winner=("dice4 having score =$d");
      }

    });
  }
  int result()
  {
      if (a > b) {
        if (b > c) {
          if (c > d) {
            print("Dice1 is winner/nTotal Sum =$count /n Dice1 score = $a");
            winner=("Dice1 score =$a") ;
          }
        }
      }

  if (b > a) {
    if (b > c) {
      if (b > d) {
        print("Dice2 is winner/nTotal Sum =$count /n Dice2 score = $b");
        winner=("Dice1 score =$b") ;
      }
    }
  }


  if (c > a) {
    if (c > b) {
      if (c > d) {
        print("Dice3 is winner/nTotal Sum =$count /n Dice3 score = $c");
        winner=("Dice1 score =$c") ;
      }
    }
  }

    if (d > a) {
      if (d > b) {
        if (d > c) {
          print("Dice4 is winner/nTotal Sum =$count /n Dice14score = $d");
          winner=("Dice1 score =$d") ;
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.lightGreenAccent,
            appBar: AppBar(
              title: Text("Total:$count"),
              centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            body: Container(
              child:
              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [Row(
                    children: [
                      Expanded(
                          child: Text('Dice1=${a}', textAlign: TextAlign.center)
                      ),
                      Expanded(
                          child: Text('Dice2=${b}', textAlign: TextAlign.center)
                      ),
                      Expanded(
                          child: Text('Dice3=${c}', textAlign: TextAlign.center)
                      ),
                      Expanded(
                          child: Text('Dice4=${d}', textAlign: TextAlign.center)
                      ),

                    ]
                ),


                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                          child: Image.asset('images/dice$dice1.png'),
                          onPressed: () {
                            setState(() {
                              dice1 = Random().nextInt(6) + 1;
                              a = a + dice1;
                              totalSumofDices();
                            });
                            print(num);
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          child: Image.asset('images/dice$dice2.png'),
                          onPressed: () {
                            setState(() {
                              dice2 = Random().nextInt(6) + 1;
                              b = b + dice2;
                              totalSumofDices();
                            });
                            print(num);
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          child: Image.asset('images/dice$dice3.png'),
                          onPressed: () {
                            setState(() {
                              dice3 = Random().nextInt(6) + 1;
                              c = c + dice3;
                              totalSumofDices();
                            });
                            print(num);
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          child: Image.asset('images/dice$dice4.png'),
                          onPressed: () {
                            setState(() {
                              dice4 = Random().nextInt(6) + 1;
                              d = d + dice4;
                              totalSumofDices();
                              //sum();
                            });
                            print(num);
                          },
                        ),
                      ),
                    ],

                  ),
                ],
              ),

            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // show the dialog;
                  showDialog(context:context,
                  builder: (BuildContext context){
                          return dialogbox('total score=$count and winner is $winner');
                  }
                  );
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.lightbulb_outline
                )
            )
        )
    );
  }
  }

class dialogbox extends StatelessWidget{
 var title;
 dialogbox(this.title);
 @override
  Widget build(BuildContext context){
   return AlertDialog(
     title: Text('Winner'),
     content: Text(title),
     actions: [
       new TextButton(onPressed: (){ Navigator.of(context).pop();}, child:Text('ok'))
     ],
   );
  }

}

