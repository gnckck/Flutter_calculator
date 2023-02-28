part of 'calculator_bloc.dart';

class CalculatorState {
  final String mainExpression;
  final double mainResultText;
  final String subExpression;

  CalculatorState({
    // 그냥 초기값이라 생각하면됨
    this.mainExpression = '0',
    this.mainResultText = 0,
    this.subExpression = '',
  });

  CalculatorState copyWith({
    // 변화를 줄때는 copyWith 사용
    String? mainExpression,
    double? mainResultText,
    String? subExpression,
  }) =>
      CalculatorState(
        mainExpression: mainExpression ?? this.mainExpression,
        mainResultText: mainResultText ?? this.mainResultText,
        subExpression: subExpression ?? this.subExpression,
      );
}
