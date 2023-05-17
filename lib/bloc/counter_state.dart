class CounterState {
  int son;
  CounterState({required this.son});
}

class InitState extends CounterState {
  InitState() : super(son: 0);
}
