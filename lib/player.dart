import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  const MyPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        alignment: Alignment(playerX, 1),
        child: Container(
          color: Colors.black,
          height: 50.0,
          width: 50.0,
        ),
      ),
    );
  }
}
