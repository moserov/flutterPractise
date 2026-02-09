import 'package:flutter/material.dart';

class Day1BasicsPage extends StatefulWidget {
  const Day1BasicsPage({super.key}); // This line is the 'constructor' it's looking for

  @override
  State<Day1BasicsPage> createState() => _Day1BasicsPageState();
}

class _Day1BasicsPageState extends State<Day1BasicsPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Day 1 Basics")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Score: $counter", style: const TextStyle(fontSize: 40)),
            ElevatedButton(
              onPressed: () => setState(() => counter++),
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}