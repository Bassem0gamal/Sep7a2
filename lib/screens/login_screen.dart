import 'package:flutter/material.dart';
import 'package:sep7a2_app/components/rounded_button.dart';
import 'package:sep7a2_app/screens/new_home_screen.dart';
import 'package:sep7a2_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  static String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey();
    var nameController = TextEditingController();
    String newUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
              height: 20.0,
            ),
            Form(
              key: _key,
              child: TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter your name';
                  }
                  return null;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your name'),
                onChanged: (user) {
                  newUser = user;
                },
              ),
            ),
            RoundedButton(
              text: 'Log In',
              color: Colors.blueAccent,
              onPressed: () async {
                if (_key.currentState!.validate()) {
                  NewHomeScreen.userName.value = nameController.text;
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  await pref.setString('login', nameController.text);

                  Navigator.pushNamed(context, NewHomeScreen.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
