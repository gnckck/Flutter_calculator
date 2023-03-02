part of 'calculator_bloc.dart';

class CalculatorState {
  final String mainExpression;
  final double result;
  final String subExpression;

  CalculatorState({
    this.mainExpression = '0',
    this.result = 0,
    this.subExpression = '',
  });

  CalculatorState copyWith({
    String? mainExpression,
    double? result,
    String? subExpression,
  }) =>
      CalculatorState(
        mainExpression: mainExpression ?? this.mainExpression,
        result: result ?? this.result,
        subExpression: subExpression ?? this.subExpression,
      );
}
