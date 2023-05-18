import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson8withbloc/bloc/postList_bloc.dart';
import 'package:lesson8withbloc/bloc/postList_state.dart';
import 'package:lesson8withbloc/model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            BlocBuilder<HomeBloc, PostListState>(builder: (context, state) {}));
  }
}

Widget _itemPost(Post post) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Text(
          post.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          post.body,
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}
