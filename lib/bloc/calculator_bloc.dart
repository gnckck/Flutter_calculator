import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<RemoveNum>((event, emit) => emit(CalculatorState(
          resultText:
              (state.resultText).substring(0, (state.resultText).length - 1),
        )));
    on<AddNum>((event, emit) => emit(CalculatorState(
          resultText: (state.resultText == '0')
              ? event.number
              : state.resultText + event.number,
        )));
  }
}
