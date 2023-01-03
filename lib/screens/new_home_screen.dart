import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sep7a2_app/screens/welcome_screen.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  static ValueNotifier<String?> userName = ValueNotifier('');
  static ValueNotifier<int?> userCounter = ValueNotifier(0);

  static String id = 'new_home_screen';

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  int counter = 0;

  void counterIncrement() async{
    setState(() {
      counter++;
      NewHomeScreen.userCounter.value = counter;
      print(NewHomeScreen.userCounter);
    });
    SharedPreferences counterPref = await SharedPreferences.getInstance();
    await counterPref.setInt('counter', counter);
    final userCounter = counterPref.getInt('counter');
    NewHomeScreen.userCounter.value = userCounter;
    print(userCounter);
  }

  void counterReset() {
    setState(() {
      counter = 0;
      NewHomeScreen.userCounter.value = counter;
    });
    Navigator.pop(context);
  }

  Future getCounter() async {
    SharedPreferences counterPref = await SharedPreferences.getInstance();
    await counterPref.setInt('counter', counter);
    final userCounter = counterPref.getInt('counter');
    return userCounter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  'Sep7a2',
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: const Text('Restarte'),
              onTap: counterReset,
            ),
            ListTile(
                title: const Text('Log out'),
                onTap: () async {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushNamed(context, WelcomeScreen.id);
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  await pref.clear();
                }),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Sep7a2'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: NewHomeScreen.userName,
              builder: (BuildContext context, String? userName, Widget? child) {
                return Text(
                  'Welcome $userName',
                  style:
                      const TextStyle(fontSize: 28.0, color: Colors.blueAccent),
                );
              },
            ),
            const SizedBox(
              height: 100.0,
            ),
            const Text(
              'Tasbee7',
              style: TextStyle(fontSize: 32.0, color: Colors.blueAccent),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ValueListenableBuilder(
                valueListenable: NewHomeScreen.userCounter,
                builder:
                    (BuildContext context, int? userCounter, Widget? child) {
                  return Text(
                    '$userCounter',
                    style: const TextStyle(
                        fontSize: 28.0, color: Colors.blueAccent),
                  );
                }),
            const SizedBox(
              height: 80.0,
            ),
            FloatingActionButton(
              onPressed: counterIncrement,
              child: const Icon(
                Icons.add,
                size: 32.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
