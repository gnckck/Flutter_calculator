import 'package:flutter/material.dart';

class SubResultScreen extends StatelessWidget {
  final String text;

  const SubResultScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(bottom: 5),
      width: 330,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
