import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    List<String> operation = ['+', '-', '÷', 'x', '%'];
    bool isResult = false;

    on<RemoveNum>((event, emit) => emit(state.copyWith(
          mainExpression: ((state.mainExpression).length == 1)
              ? '0'
              : (state.mainExpression)
                  .substring(0, (state.mainExpression).length - 1),
        )));
    on<AddNum>((event, emit) {
      if (state.mainExpression == '0') {
        emit(state.copyWith(mainExpression: event.number));
      } else if (state.mainExpression == state.mainResultText) {
        emit(state.copyWith(
            subExpression: state.mainResultText, mainExpression: event.number));
      } else {
        emit(state.copyWith(
            mainExpression: state.mainExpression + event.number));
      }
    }
        // emit(state.copyWith(
        // mainResultText: (state.mainResultText == '0')
        // ? event.number
        // : state.mainResultText + event.number,))
        );

    on<AddOperator>((event, emit) {
      List splitText = state.mainExpression.split('');
      if (operation.any((e) => e == splitText.last)) {
        splitText.removeLast();
        emit(state.copyWith(mainExpression: splitText.join() + event.operator));
      } else {
        emit(state.copyWith(
            mainExpression: state.mainExpression + event.operator));
      }
    });

    on<ResultOperator>((event, emit) {
      List splitText = state.mainExpression.split('');
      if (!operation.any((e) => e == splitText.last)) {
        emit(state.copyWith(
          subExpression: '${state.mainExpression} =',
          mainExpression: state.mainResultText,
        ));
        isResult = true;
      }
    });
  }
}
