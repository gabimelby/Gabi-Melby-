//Gabi Melby
//used chatgpt and deep seek to help me create my classes for my project. 
//also had them help me create my controller and models. 


import 'package:flutter/material.dart';
import 'views/kill_tracker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basketball Kill Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KillTrackerScreen(),
    );
  }
}
