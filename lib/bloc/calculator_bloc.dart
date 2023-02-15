import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<RemoveNum>((event, emit) => emit(CalculatorState(
          resultText: ((state.resultText).length == 1)
              ? '0'
              : (state.resultText).substring(0, (state.resultText).length - 1),
        )));
    on<AddNum>((event, emit) => emit(CalculatorState(
          resultText: (state.resultText == '0')
              ? event.number
              : state.resultText + event.number,
        )));
    on<AddOper>((event, emit) {
      List<String> oper = ['+', '-', '÷', 'x'];
      List splitedText = state.resultText.split('');
      if (oper.any((e) => e == splitedText.last)) {
        splitedText.removeLast();
        emit(CalculatorState(resultText: splitedText.join() + event.operator));
      } else {
        emit(CalculatorState(resultText: state.resultText + event.operator));
      }
      // if ((state.resultText).endsWith('+')) {
      //   emit(CalculatorState(
      //       resultText:
      //           (state.resultText).substring(0, (state.resultText).length - 1) +
      //               event.operator));
      // } else {
      //   emit(CalculatorState(resultText: state.resultText + event.operator));
      // }
    });
  }
}
