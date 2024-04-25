import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  const MyBall({super.key, required this.ballX, required this.ballY});

  final double ballX;
  final double ballY;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.brown,
      ),
    );
  }
}
