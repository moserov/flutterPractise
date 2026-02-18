import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';
import '../../data/repositories/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc(this.repository) : super(PostInitial()) {
    on<LoadPostsEvent>((event, emit) async {
      emit(PostLoading()); // Tell the UI to show a spinner
      try {
        final posts = await repository.fetchPosts();
        emit(PostLoaded(posts)); // Send the data to the UI
      } catch (e) {
        emit(PostError("Could not load posts. Check your connection."));
      }
    });
  }
}