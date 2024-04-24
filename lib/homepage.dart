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
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey[100],
            child: Row(
              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
