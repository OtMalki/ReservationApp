import 'package:flutter/material.dart';
import 'package:reservation/ReservationPage.dart';

class NextPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => NextPageState();
}

class NextPageState extends State<NextPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Welcome to my medical reservation app", 
        style: TextStyle(color: Colors.purple, fontSize: 40, fontWeight: FontWeight.bold), 
        textAlign: TextAlign.center,),
        SizedBox(height: 10,),
        ElevatedButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReservationPage()),
            )
          }, 
          child: Text("Tap here to go to the reservation page", 
            style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold), 
            textAlign: TextAlign.center,),
          )
    ]),
    );
  }
}
