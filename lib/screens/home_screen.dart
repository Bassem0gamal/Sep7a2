// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:sep7a2_app/screens/welcome_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   static ValueNotifier<String?> userName = ValueNotifier('');
//   static String id = 'home_screen';
//
//   @override
//   State<HomeScreen> createState() => HomeScreenState();
// }
//
// class HomeScreenState extends State<HomeScreen> {
//   // final Future<SharedPreferences> _preferences =
//   //     SharedPreferences.getInstance();
//   // late Future<int> _theCounter;
//
//   //Future<void> _counterIncrement() async {
//   //   final SharedPreferences preferences = await _preferences;
//   //   final int theCounter = (preferences.getInt('counter') ?? 0) + 1;
//   //
//   //   setState(() {
//   //     _theCounter =
//   //         preferences.setInt('counter', theCounter).then((bool success) {
//   //       return theCounter;
//   //     });
//   //   });
//   // }
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _theCounter = _preferences.then((SharedPreferences preferences) {
//   //     return preferences.getInt('counter') ?? 0;
//   //   });
//   // }
//
//   void resetCounter() {
//     setState(() async {
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       await preferences.remove('counter');
//       Navigator.pop(context);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue),
//               child: Center(
//                 child: Text(
//                   'Sep7a',
//                   style: TextStyle(color: Colors.white, fontSize: 32.0),
//                 ),
//               ),
//             ),
//             ListTile(
//               title: const Text('Reset my counter'),
//               onTap: resetCounter,
//             ),
//             ListTile(
//               title: const Text('Log out'),
//               onTap: () async {
//                 Navigator.of(context).popUntil((route) => route.isFirst);
//                 Navigator.pushNamed(context, WelcomeScreen.id);
//                 SharedPreferences pref = await SharedPreferences.getInstance();
//                 await pref.clear();
//               },
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text('Sep7a'),
//       ),
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ValueListenableBuilder(
//               valueListenable: HomeScreen.userName,
//               builder: (BuildContext context, String? userName, Widget? child) {
//                 return Text(
//                   'Welcome $userName',
//                   style:
//                       const TextStyle(fontSize: 28.0, color: Colors.blueAccent),
//                 );
//               },
//             ),
//             const SizedBox(
//               height: 100.0,
//             ),
//             const Text(
//               'Tasbee7',
//               style: TextStyle(fontSize: 32.0, color: Colors.blueAccent),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             const Text(
//               '',
//               style: TextStyle(fontSize: 28.0, color: Colors.blueAccent),
//             ),
//             const SizedBox(
//               height: 80.0,
//             ),
//             FloatingActionButton(
//               onPressed: (){},//_counterIncrement,
//               child: const Icon(
//                 Icons.add,
//                 size: 32.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// //
