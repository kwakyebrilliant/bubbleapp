import 'package:bubbleapp/button.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.amber[100],
            child: Center(
              child: Stack(
                children: [
                  Container(
                    alignment: const Alignment(0, 1),
                    child: Container(
                      color: Colors.black,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey[100],
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  icon: Icons.arrow_back,
                ),
                MyButton(
                  icon: Icons.arrow_upward,
                ),
                MyButton(
                  icon: Icons.arrow_forward,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
