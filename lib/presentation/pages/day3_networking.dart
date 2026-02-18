import 'package:flutter/material.dart';
import 'package:roadmap/data/repositories/post_repository.dart';

class Day3NetworkingPage extends StatefulWidget {
  final String title;
  const Day3NetworkingPage({super.key, required this.title});

  @override
  State<Day3NetworkingPage> createState() => _Day3NetworkingPageState();
}

class _Day3NetworkingPageState extends State<Day3NetworkingPage> {
  final PostRepository _postRepo = PostRepository();

  // Late initialization of the future to avoid re-fetching on every build
  late Future<List<Map<String, String>>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = _postRepo.fetchPosts(); // Trigger once on mount (like UseEffect in React)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)), 
      body: FutureBuilder<List<Map<String, String>>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          // 1. Handle Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Handle Error State
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // 3. Handle Success State
          final posts = snapshot.data ?? [];
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  //textColor: Colors.cyan,
                  title: Text(posts[index]['title']!),
                  subtitle: Text(posts[index]['body']!),
                  leading: const Icon(Icons.article),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
