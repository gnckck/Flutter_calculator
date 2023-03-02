import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

const int minimumLength = 1;
const String initialize = '0';
const List<String> operator = ['+', '-', '÷', '×', '%'];

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<RemoveNum>((event, emit) => emit(state.copyWith(
          mainExpression: (state.mainExpression.length == minimumLength)
              ? initialize
              : state.mainExpression
                  .substring(0, state.mainExpression.length - 1),
        )));

    on<AddNum>((event, emit) {
      if (state.mainExpression == initialize) {
        return emit(state.copyWith(
            subExpression: 'Ans = 0', mainExpression: event.number));
      }
      if (state.mainExpression == state.result.toString()) {
        return emit(state.copyWith(
            subExpression: 'Ans = ${state.result}',
            mainExpression: event.number));
      }
      return emit(
          state.copyWith(mainExpression: state.mainExpression + event.number));
    });

    on<AddOperator>((event, emit) {
      List splitText = state.mainExpression.split('');
      String newExpression = state.mainExpression + event.operator;

      if (operator.any((e) => e == splitText.last)) {
        splitText.removeLast();
        return emit(
            state.copyWith(mainExpression: splitText.join() + event.operator));
      }
      if (state.mainExpression == state.result.toString()) {
        return emit(
          state.copyWith(
            subExpression: 'Ans = ${state.result}',
            mainExpression: newExpression,
          ),
        );
      }
      return emit(state.copyWith(mainExpression: newExpression));
    });

    on<ResultOperator>((event, emit) {
      List splitText = state.mainExpression.split('');
      RegExp regExpExpression = RegExp(r'\d+|[+×÷-]');

      if (!operator.any((e) => e == splitText.last)) {
        emit(state.copyWith(
          subExpression: '${state.mainExpression} =',
          mainExpression: state.result.toString(),
        ));
        List<String> expression = postfix(
          state.mainExpression,
          regExpExpression,
          state.subExpression,
        );

        double calculatedResult = postfixCalculate(expression);

        emit(state.copyWith(
          result: calculatedResult,
          mainExpression: calculatedResult.toString(),
        ));
      }
    });
  }
  // handleRemoveNumber(RemoveNum event, Emitter emit) => emit(
  //       state.copyWith(
  //         mainExpression: (state.mainExpression.length == minimumLength)
  //             ? initialize
  //             : state.mainExpression
  //                 .substring(0, state.mainExpression.length - 1),
  //       ),
  //     );

// List<String> postfix({
//     required String text,
//     required RegExp regExpExpression,
//     required String subExpression,
//   }) {... something}

  bool isDigit(String value) => RegExp(r'\d+').hasMatch(value);

  List<String> postfix(
    String text,
    RegExp regExpExpression,
    String subExpression,
  ) {
    List<String> expression = [];
    List<String> stack = [];
    Iterable<RegExpMatch> matchesExpression =
        regExpExpression.allMatches(subExpression);
    // allMatches는 정규 표현식에서 일치하는 문자열을 찾아서 반환
    // r은 raw string (문자 그대로)
    for (final RegExpMatch matchedString in matchesExpression) {
      String text = matchedString[0]!;
      if (isDigit(text)) {
        expression.add(text);
      } else {
        while (stack.isNotEmpty && precedence(stack.last) >= precedence(text)) {
          expression.add(stack.removeLast());
        }
        stack.add(text);
      }
    }
    // while (stack.isNotEmpty) {
    //   expression.add(stack.removeLast());
    // }
    expression.addAll(stack.reversed);
    return expression;
  }

  int precedence(String operator) {
    switch (operator) {
      case '+':
      case '-':
        return 1;
      case '×':
      case '÷':
        return 2;
      default:
        return 0;
    }
  }

  double postfixCalculate(List<String> expression) {
    List<double> stack = [];
    for (String element in expression) {
      if (isDigit(element)) {
        stack.add(double.parse(element));
      } else {
        double b = stack.removeLast();
        double a = stack.removeLast();
        switch (element) {
          case '+':
            stack.add(a + b);
            break;
          case '-':
            stack.add(a - b);
            break;
          case '×':
            stack.add(a * b);
            break;
          case '÷':
            stack.add(a / b);
            break;
        }
      }
    }
    if (stack.length != 1) {
      throw const FormatException('??');
      // throw 절을 통하여 예외 상황 발생 시 객체 또는 코드 등을 반환

    }
    return stack.single; // 리스트에 단 1개의 요소만 있다면 해당 요소 리턴
  }
}
