import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson8withbloc/bloc/counter_bloc.dart';
import 'package:lesson8withbloc/bloc/counter_event.dart';
import 'package:lesson8withbloc/bloc/counter_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.son.toString(),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(Kamaytirish());
                    },
                    child: Text("-")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Oshirish());
                    },
                    child: Text("+")),
              ],
            )
          ],
        ),
      )),
    );
  }
}
