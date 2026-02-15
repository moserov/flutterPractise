import 'package:roadmap/domain/models/user_model.dart'; 

class PostRepository {
  Future<List<Map<String, String>>> fetchPosts() async {
    // 1. Simulate network latency (like API)
    await Future.delayed(const Duration(seconds: 2));

    // 2. Return mock data
    return [
      {
        'title': 'Clean Architecture',
        'body': 'Developer love seeing folders like data, domain, and presentation and so on...'
      },
      {
        'title': 'The Power of BLoC',
        'body': 'Tomorrow we move from FutureBuilder to BLoC for state.'
      },
    ];
  }
}