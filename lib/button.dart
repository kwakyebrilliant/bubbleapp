import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.icon});
  final icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        color: Colors.amber,
        height: 50.0,
        width: 50.0,
        child: Center(
          child: Icon(
            icon,
            color: Colors.grey[100],
          ),
        ),
      ),
    );
  }
}
