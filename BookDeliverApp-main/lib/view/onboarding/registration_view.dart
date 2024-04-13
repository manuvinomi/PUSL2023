import 'package:flutter/material.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green, // Set primary color to green
        hintColor: Colors.greenAccent, // Set accent color to green accent
        fontFamily: 'Roboto', // Use custom font
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Novel Nest - Registration', 
            style: TextStyle(fontWeight: FontWeight.bold), // Bold title
          ), 
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          color: Colors.white, // Set background color to white
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded border
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your registration logic here
                  // For now, navigate to login
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded button
                  ),
                ),
                child: Text(
                  'Register', 
                  style: TextStyle(fontSize: 16), // Font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
