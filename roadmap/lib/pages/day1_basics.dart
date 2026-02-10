import 'package:flutter/material.dart';
import 'package:roadmap/models/user_model.dart';

class Day1BasicsPage extends StatefulWidget {
  final String title;
  final UserModel myUser = UserModel(name: 'Micha', age: 30);

  Day1BasicsPage({super.key, required this.title});

  @override
  State<Day1BasicsPage> createState() => _Day1BasicsPageState();
}

class _Day1BasicsPageState extends State<Day1BasicsPage> {
  int _counter = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        padding: const EdgeInsets.all(16), 
        children: [
          _buildUserHeader(),
          const SizedBox(height: 24),
          _buildWelcomeBanner(),
          const SizedBox(height: 24),
          _buildCounterSection(),
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Column(
      children: [
        Text("Name: ${widget.myUser.name}", style: const TextStyle(fontSize: 20)),
        Text("Age: ${widget.myUser.age ?? "Unknown"}", style: const TextStyle(fontSize: 20)),
      ],
    );
  }

  Widget _buildWelcomeBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1), 
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column( 
        children: [
          Text("Welcome to the HAHA Flutter!", 
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text("Learning bla bla bla", 
            style: TextStyle(fontSize: 14, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterSection() {
    final isEven = _counter % 2 == 0; 

    return Column(
      children: [
        Text("Score: $_counter", style: const TextStyle(fontSize: 40)),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () => setState(() => _counter++),
          icon: const Icon(Icons.add),
          label: const Text("Increment"),
        ),
        const SizedBox(height: 16),
        Text(
          "Counter is ${isEven ? "Even" : "Odd"}",
          style: TextStyle(
            fontSize: 18, 
            color: isEven ? Colors.green : Colors.orange,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}