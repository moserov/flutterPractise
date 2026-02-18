import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadmap/presentation/bloc/post_bloc.dart';
import 'package:roadmap/presentation/bloc/post_event.dart';
import 'package:roadmap/presentation/bloc/post_state.dart';
import 'package:roadmap/data/repositories/post_repository.dart';

class Day4BlocPage extends StatelessWidget {
  final String title;
  const Day4BlocPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // 1. Provide the BLoC to the subtree
      create: (context) => PostBloc(PostRepository())..add(LoadPostsEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            // 2. React to the different states
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.posts[index]['title']!),
                  subtitle: Text(state.posts[index]['body']!),
                  leading: const Icon(Icons.assignment_turned_in_sharp),
                ),
              );
            } else if (state is PostError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("Welcome to BLoC"));
          },
        ),
        // Floating Action Button to "Retry"
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () => context.read<PostBloc>().add(LoadPostsEvent()),
            child: const Icon(Icons.refresh),
          );
        }),
      ),
    );
  }
}
