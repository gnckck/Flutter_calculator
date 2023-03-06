import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color bgColor;
  final String text;

  final Function onPressed;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onPressed,
    bgColor,
  })  : bgColor = bgColor ?? const Color(0xff333333),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = TextButton.styleFrom(
      backgroundColor: bgColor,
      shape: const StadiumBorder(),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 7, right: 5, left: 5),
      child: TextButton(
        style: buttonStyle,
        child: SizedBox(
          width: 65,
          height: 65,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
            ),
          )),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
