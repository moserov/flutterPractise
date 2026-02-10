import 'package:flutter/material.dart';
import 'package:roadmap/pages/home.dart';
import 'package:roadmap/pages/day1_basics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/day1': (context) =>
            Day1BasicsPage(title: "Day 1: Dart Shenanigans"),
      },
    );
  }
}
