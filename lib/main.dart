import 'package:flutter/material.dart';
import 'package:pomodoro/presentation/HomePage.dart';

void main() {
  runApp(const MyApp());
}

// @pragma("vm:entry-point")
// void overlayMain() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Material(child: Text("My overlay"))
//   ));
// }






class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomodoro',
      home: SafeArea(child: Homepage()),
    );
  }
}
