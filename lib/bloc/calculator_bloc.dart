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
  String get removeLast =>
      state.mainExpression.substring(0, state.mainExpression.length - 1);
  bool get lastIsOperator =>
      RegExp(r'[\+\-\÷\×\%]$').hasMatch(state.mainExpression);
  String get beforeResult => 'Ans = ${state.result}'; // 2.

  CalculatorBloc() : super(CalculatorState()) {
    on<RemoveNum>((event, emit) => emit(state.copyWith(
          mainExpression: (state.mainExpression.length == minimumLength)
              ? initialize
              : removeLast,
        )));

    on<AddNum>((event, emit) {
      if (state.mainExpression == initialize || // 1.
          state.mainExpression == state.result.toString()) {
        return emit(
          state.copyWith(
            subExpression: beforeResult,
            mainExpression: event.number,
          ),
        );
      }
      return emit(
        state.copyWith(mainExpression: state.mainExpression + event.number),
      );
    });

    on<AddOperator>((event, emit) {
      String newExpression = state.mainExpression + event.operator;
      if (lastIsOperator) {
        return emit(
          state.copyWith(
            mainExpression: removeLast + event.operator,
          ),
        );
      }

      if (state.mainExpression == state.result.toString()) {
        return emit(
          state.copyWith(
            subExpression: beforeResult,
            mainExpression: newExpression,
          ),
        );
      }
      return emit(state.copyWith(mainExpression: newExpression));
    });

    on<ResultOperator>((event, emit) {
      if (!lastIsOperator) {
        emit(state.copyWith(
          subExpression: '${state.mainExpression} =',
          mainExpression: state.result.toString(),
        ));
        List<String> expression = postfix(
          state.mainExpression,
          RegExp(r'\d+|[+×÷-]').allMatches(state.subExpression), // 3.
        );

        double calculatedResult = postfixCalculate(expression);

        emit(state.copyWith(
          result: calculatedResult,
          mainExpression: calculatedResult.toString(),
        ));
      }
    });
  }

  bool isDigit(String value) => RegExp(r'\d+').hasMatch(value);

  List<String> postfix(String text, Iterable<RegExpMatch> matchesExpression) {
    List<String> expression = [];
    List<String> stack = [];

    for (final RegExpMatch matchedString in matchesExpression) {
      String text = matchedString[0]!;
      if (isDigit(text)) {
        expression.add(text);
        continue;
      }
      // else {
      while (stack.isNotEmpty && precedence(stack.last) >= precedence(text)) {
        expression.add(stack.removeLast());
      }
      stack.add(text);
      // }
    }
    return [...expression, ...stack.reversed];
    // expression.addAll(stack.reversed);
    // return expression;
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
    }
    return stack.single;
  }
}
