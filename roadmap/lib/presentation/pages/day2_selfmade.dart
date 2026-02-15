import 'package:flutter/material.dart';

class Day2SelfMadePage extends StatelessWidget {
  final String title;

  const Day2SelfMadePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.asset('assets/images/Pic-19.webp',
                    fit: BoxFit.cover, width: double.infinity),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: myRedContainer(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Box 1
                Expanded(
                  child: Container(height: 50, color: Colors.blue),
                ),
                const SizedBox(width: 10), // Gap
                // Box 2
                Expanded(
                  child: Container(height: 50, color: Colors.green),
                ),
                const SizedBox(width: 10), // Gap
                // Box 3
                Expanded(
                  child: Container(height: 50, color: Colors.orange),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myRedContainer() {
    return Container(
      color: Colors.redAccent.withOpacity(0.5),
      width: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Shrinks to fit content
        children: [
          const Text('wow',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text("This is my goofing around!", textAlign: TextAlign.center),
          Image.asset('assets/images/pic1.jpeg'),
        ],
      ),
    );
  }
}
