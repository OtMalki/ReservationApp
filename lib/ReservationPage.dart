import 'package:flutter/material.dart';
import 'package:reservation/ReservationsList.dart';

class ReservationPage extends StatefulWidget{
  const ReservationPage({super.key});

  @override
  State<StatefulWidget> createState() => ReservationPageState();
}

class ReservationPageState extends State<ReservationPage> {
  Color backgroundColor = Colors.white;
  Color TextColor = Colors.black;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _NameController.text;
    String password = _passwordController.text;

    if (email == 'admin' && password == 'password') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ReservationsList()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid email or password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make a reservation", style: TextStyle(color: TextColor)),
        backgroundColor: backgroundColor,
        leading: const Icon(Icons.home),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _NameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  // You can add more password validation logic here if needed
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login, // Call the _login function when the login button is pressed
                child: const Text("Reserver"),
              ),
            ],
          ),
        ),
      ),
    );
}}