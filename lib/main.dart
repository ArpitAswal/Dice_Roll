import 'package:flutter/material.dart';

import 'dice_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice ROll',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     debugShowCheckedModeBanner: false,
    home: const DiceScreen(),
    );
  }
}
