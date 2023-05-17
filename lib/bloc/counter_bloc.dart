import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitState()) {
    on<Oshirish>((Oshirish event, Emitter<CounterState> emit) {
      emit(CounterState(son: state.son + 1));
    });

    on<Kamaytirish>((Kamaytirish event, Emitter<CounterState> emit) {
      emit(CounterState(son: state.son - 1));
    });
  }
}
