import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/switch_example/switch_bloc.dart';
import 'package:flutter_bloc_tut/switch_example/switch_state.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications"),
                BlocBuilder<SwitchBloc,SwitchState>(builder:(context,state){
                  return Switch(value: state.isSwitch, onChanged: (value) {});
                } )
                // Switch(value: true, onChanged: (newValue) {})
              ],
            ),
            SizedBox(height: 20,),
            Container(height: 200,
            color: Colors.red.withOpacity(.2),
            ),
            Slider(value: .4, onChanged: (value){})
          ]),
      ),
    );
  }
}
