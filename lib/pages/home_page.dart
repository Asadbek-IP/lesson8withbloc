import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson8withbloc/bloc/postList_bloc.dart';
import 'package:lesson8withbloc/bloc/postList_event.dart';
import 'package:lesson8withbloc/bloc/postList_state.dart';
import 'package:lesson8withbloc/model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetAllPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<HomeBloc, PostListState>(builder: (context, state) {
      if (state is LoadingState || state is PostListInitState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ErrorState) {
        return Center(
          child: Text(state.error),
        );
      }

      if (state is SuccessState) {
        return ListView.builder(
            itemBuilder: ((context, index) => _itemPost(state.posts[index])));
      }

      return Container();
    }));
  }
}

Widget _itemPost(Post post) {
  return Card(
    elevation: 3,
    color: Colors.amber,
    margin: EdgeInsets.all(8),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.black,
          ),
          Text(
            post.body,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
