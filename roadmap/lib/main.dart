import 'package:flutter/material.dart';
import 'package:roadmap/presentation/pages/home.dart';
import 'package:roadmap/presentation/pages/day1_basics.dart';
import 'package:roadmap/presentation/pages/day2_ui.dart';
import 'package:roadmap/presentation/pages/day2_selfmade.dart';
import 'package:roadmap/presentation/pages/day3_networking.dart';

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
        '/day1': (context) => Day1BasicsPage(title: "Day 1: Dart Shenanigans"),
        '/day2': (context) => const Day2LayoutsPage(title: "Day 2: UI fun"),
        '/day2_selfmade': (context) =>
            const Day2SelfMadePage(title: "Day 2: Fun with images"),
        '/day3': (context) => const Day3NetworkingPage(title: "Day 3: Faking a network call",),
      },
    );
  }
}
