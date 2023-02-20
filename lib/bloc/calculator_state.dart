part of 'calculator_bloc.dart';

class CalculatorState {
  final String mainExpression;
  final String mainResultText;
  final String subExpression;
  final List number;
  final List operator;

  CalculatorState({
    // 그냥 초기값이라 생각하면됨
    this.mainExpression = '0',
    this.mainResultText = '결과',
    this.subExpression = '',
    number,
    operator,
  })  : operator = operator ?? [],
        number = number ?? [];

  CalculatorState copyWith({
    // 변화를 줄때는 copyWith 사용
    String? mainExpression,
    String? mainResultText,
    String? subExpression,
    List? number,
    List? operator,
  }) =>
      CalculatorState(
        mainExpression: mainExpression ?? this.mainExpression,
        mainResultText: mainResultText ?? this.mainResultText,
        subExpression: subExpression ?? this.subExpression,
        number: number ?? this.number,
        operator: operator ?? this.operator,
      );
}
