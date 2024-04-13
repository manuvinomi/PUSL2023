import 'package:flutter/material.dart';

import 'package:book_grocer/common/color_extenstion.dart';
import 'package:book_grocer/view/main_tab/main_tab_view.dart';
import 'package:book_grocer/view/onboarding/login_view.dart';
import 'package:book_grocer/view/onboarding/registration_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Novel Nest-Group 13',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: TColor.primary,
        fontFamily: 'SF Pro Text',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RegistrationView(),
        '/login': (context) => LoginView(),
        '/main': (context) => MainTabView(),
      },
    );
  }
}
