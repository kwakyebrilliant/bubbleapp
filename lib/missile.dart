import 'package:flutter/material.dart';

class MyMissile extends StatelessWidget {
  const MyMissile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(missleX, missleY),
      child: Container(
        width: 2.0,
        height: missleHeight,
        color: Colors.red,
      ),
    );
  }
}
