import 'package:flutter/material.dart';
import 'package:sep7a2_app/screens/new_home_screen.dart';
import 'package:sep7a2_app/screens/welcome_screen.dart';
import 'package:sep7a2_app/screens/home_screen.dart';
import 'package:sep7a2_app/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LogInScreen.id: (context) => const LogInScreen(),
        //HomeScreen.id: (context) => const HomeScreen(),
        NewHomeScreen.id :(context) => const NewHomeScreen(),
      },
    );
  }
}
