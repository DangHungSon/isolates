import 'package:equatable/equatable.dart';
import 'package:isolates/model/post_model.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class PostInit extends PostState {
  const PostInit();

  @override
  List<Object?> get props => [];
}

class PostLoading extends PostState {
  const PostLoading();
}

class PostLoaded extends PostState {
  final List<PostModel> posts;
  const PostLoaded({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class PostLoadError extends PostState {
  final String msg;
  const PostLoadError({required this.msg});

  @override
  List<Object?> get props => [msg];
}
