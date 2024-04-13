import 'package:flutter/material.dart';
import 'package:book_grocer/view/main_tab/main_tab_view.dart';

class RegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registration Page',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your registration logic here
                // For simplicity, let's navigate to the MainTabView
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainTabView(),
                  ),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
