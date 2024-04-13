import 'package:flutter/material.dart';
import 'package:book_grocer/view/main_tab/main_tab_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Page',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your login logic here
                // For simplicity, let's navigate to the MainTabView
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainTabView(),
                  ),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
