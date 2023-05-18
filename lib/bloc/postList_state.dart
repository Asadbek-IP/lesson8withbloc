import 'package:equatable/equatable.dart';
import 'package:lesson8withbloc/model/post.dart';

class PostListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostListInitState extends PostListState {}

class LoadingState extends PostListState {}

class SuccessState extends PostListState {
  List<Post> posts;

  SuccessState({required this.posts});
}

class ErrorState extends PostListState {
  final String error;
  ErrorState({required this.error});
}
