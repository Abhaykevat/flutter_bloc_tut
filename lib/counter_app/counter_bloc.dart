

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/counter_app/counter_events.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<Increment>((event, emit) {
      emit(CounterState(state.counterValue + 1));
    });

    on<Decrement>((event, emit) {
      emit(CounterState(state.counterValue - 1));
    });
  }
}
