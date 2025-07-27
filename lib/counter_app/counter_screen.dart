
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/counter_app/counter_bloc.dart';
import 'package:flutter_bloc_tut/counter_app/counter_events.dart';
import 'package:flutter_bloc_tut/counter_app/counter_state.dart';
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              'Counter: ${state.counterValue}',
              style: const TextStyle(fontSize: 30),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: () => counterBloc.add(Decrement()),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () => counterBloc.add(Increment()),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
