import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson8withbloc/bloc/postList_event.dart';
import 'package:lesson8withbloc/bloc/postList_state.dart';
import 'package:lesson8withbloc/services/api_service.dart';

class HomeBloc extends Bloc<HomeEvent, PostListState> {
  HomeBloc() : super(PostListInitState()) {
    on<GetAllPostEvent>(_getAllPost);
  }

  Future<void> _getAllPost(
      GetAllPostEvent event, Emitter<PostListState> emit) async {
    emit(LoadingState());

    try {
      final javob = await ApiService.getAllPosts();
      emit(SuccessState(posts: javob));
    } catch (error) {
      emit(ErrorState(error: error.toString()));
    }
  }
}
