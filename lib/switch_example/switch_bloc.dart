import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/switch_example/switch_event.dart';
import 'package:flutter_bloc_tut/switch_example/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents,SwitchState>{
  SwitchBloc():super(SwitchState()){
    on<EnableOrDisableNotification>(_enableOrDisableNOtification);
  }

  void _enableOrDisableNOtification(EnableOrDisableNotification events,Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
    
  }
}