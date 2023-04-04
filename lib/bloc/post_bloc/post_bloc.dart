import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isolates/bloc/post_bloc/post_event.dart';
import 'package:isolates/bloc/post_bloc/post_state.dart';
import 'package:isolates/services/call_api.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostInit()) {
    on<RequestGetPost>((event, emit) => _getPost(event, emit));
  }

  _getPost(RequestGetPost event, Emitter emit) async {
    emit(const PostLoading());
    try {
      final response = await CallApi().getData();
      emit(PostLoaded(posts: response));
    } catch (e) {
      emit(PostLoadError(msg: e.toString()));
    }
  }
}
