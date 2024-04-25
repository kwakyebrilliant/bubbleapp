import 'package:flutter/material.dart';

class MyMissile extends StatelessWidget {
  const MyMissile({super.key, this.missileX, this.height});

  final missileX;
  final height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(missileX, 1),
      child: Container(
        width: 2.0,
        height: height,
        color: Colors.amber,
      ),
    );
  }
}
