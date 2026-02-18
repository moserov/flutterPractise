import 'package:flutter/material.dart';

class Day2LayoutsPage extends StatelessWidget {
  final String title;
  const Day2LayoutsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text(title)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // If the screen is wide (like a tablet/web), show 3 columns
          // If it's narrow (mobile), show 1 column
          bool isWide = constraints.maxWidth > 600;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildHeaderStack(),
                const SizedBox(height: 24),
                isWide ? _buildWideStats() : _buildNarrowStats(),
              ],
            ),
          );
        },
      ),
    );
  }

  // A Stack allows overlapping widgets (like Position: absolute)
  Widget _buildHeaderStack() {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        const Positioned(
          bottom: 10,
          right: 10,
          child: Text(
            "Stats Overview",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // Row with Expanded widgets ensures they take equal space
  Widget _buildWideStats() {
    return const Row(
      children: [
        Expanded(
            child:
                StatCard(label: "Steps", value: "8,000", color: Colors.orange)),
        SizedBox(width: 10),
        Expanded(
            child: StatCard(label: "Cals", value: "1,200", color: Colors.red)),
        SizedBox(width: 10),
        Expanded(
            child: StatCard(label: "Water", value: "2L", color: Colors.blue)),
      ],
    );
  }

  Widget _buildNarrowStats() {
    return const Column(
      children: [
        StatCard(label: "Steps", value: "8,000", color: Colors.orange),
        SizedBox(height: 10),
        StatCard(label: "Cals", value: "1,200", color: Colors.red),
      ],
    );
  }
}

// Break the UI into a reusable component
class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const StatCard(
      {super.key,
      required this.label,
      required this.value,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(label,
              style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          Text(value,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
