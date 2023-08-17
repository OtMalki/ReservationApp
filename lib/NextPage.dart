import 'package:flutter/material.dart';
import 'package:reservation/ReservationPage.dart';

class NextPage extends StatefulWidget{
  const NextPage({super.key});

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
        children: [const Text("Welcome to my medical reservation app", 
        style: TextStyle(color: Colors.purple, fontSize: 40, fontWeight: FontWeight.bold), 
        textAlign: TextAlign.center,),
        const SizedBox(height: 10,),
        ElevatedButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReservationPage()),
            )
          }, 
          child: const Text("Tap here to go to the reservation page", 
            style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold), 
            textAlign: TextAlign.center,),
          )
    ]),
    );
  }
}
