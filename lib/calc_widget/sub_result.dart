import 'package:flutter/material.dart';

class SubResultScreen extends StatelessWidget {
  final String text;

  const SubResultScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight, // 오른쪽 끝
      margin: const EdgeInsets.only(bottom: 5),
      width: 330, // 가로 꽉차게
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
