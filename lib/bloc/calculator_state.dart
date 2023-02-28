part of 'calculator_bloc.dart';

class CalculatorState {
  final String mainExpression;
  final double result;
  final String subExpression;

  CalculatorState({
    // 그냥 초기값이라 생각하면됨
    this.mainExpression = '0',
    this.result = 0,
    this.subExpression = '',
  });

  CalculatorState copyWith({
    // 변화를 줄때는 copyWith 사용
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
