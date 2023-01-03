import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sep7a2_app/components/rounded_button.dart';
import 'package:sep7a2_app/screens/login_screen.dart';
import 'package:sep7a2_app/screens/new_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? userEmail;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    getUserName().whenComplete(() async {
      Timer(const Duration(microseconds: 500), () {
        if (userEmail != null) {
          Navigator.pushNamed(context, NewHomeScreen.id);
        }
      });
    });
  }

  Future getUserName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final userData = preferences.getString('login');
    NewHomeScreen.userName.value = userData;
    setState(() {
      userEmail = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Sep7a',
                style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.black38,
                        blurRadius: 10.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: Colors.blueAccent),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            RoundedButton(
              text: 'Start',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LogInScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
