import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context), // Pass context to use the drawer
      backgroundColor: Colors.white,
      // This is the menu in the top right (standard Material pattern)
      endDrawer: _buildNavigationDrawer(context),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'My Roadmap',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'Track my progress from React to Flutter.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // Day 1 Card
          _buildDayCard(
            context,
            title: 'Day 1: Dart & Widgets',
            subtitle: 'Stateless vs Stateful, Null Safety',
            route: '/day1',
            color: Colors.blueAccent.withOpacity(0.1),
          ),

          _buildDayCard(
            context,
            title: 'Day 2: "Body" - Layout and UI',
            subtitle: 'Constraints go down, sizes go up',
            route: '/day2',
            color: Colors.blueAccent.withOpacity(0.1),
          ),

          _buildDayCard(
            context,
            title: 'Day 2: Goofing Around',
            subtitle: 'Blabla',
            route: '/day2_selfmade',
            color: Colors.blueAccent.withOpacity(0.1),
          ),
        ],
      ),
    );
  }

  // Helper to build cards 
  Widget _buildDayCard(BuildContext context,
      {required String title,
      required String subtitle,
      required String route,
      required Color color}) {
    return Card(
      elevation: 0,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }

  // Top Menu 
  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text('Menu',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: const Text('Day 1 Basics'),
            onTap: () => Navigator.pushNamed(context, '/day1'),
          ),
          ListTile(
            title: const Text('Day 2 UI'),
            onTap: () => Navigator.pushNamed(context, '/day2'),
          ),
          ListTile(
            title: const Text('Day 2 Goofy'),
            onTap: () => Navigator.pushNamed(context, '/day2_selfmade'),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Roadmap',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      actions: [
        // This button opens endDrawer
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_book, color: Colors.black),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }
}
