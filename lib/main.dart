// ignore_for_file: prefer_const_constructors
import 'package:amazone_prime_video/screens/screen_Main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenMain(),
      debugShowCheckedModeBanner: false,
    );
  }
}
