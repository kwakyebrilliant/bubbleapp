// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:bubbleapp/button.dart';
import 'package:bubbleapp/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //player variables
  double playerX = 0;

  //missle variables
  double missleX = 0;
  double missleY = 1;

  //move player left
  void moveLeft() {
    setState(() {
      if (playerX - 0.1 < -1) {
        //do nothing
      } else {
        playerX -= 0.1;
      }
    });
  }

  //move player right
  void moveRight() {
    setState(() {
      setState(() {
        if (playerX + 0.1 > 1) {
          //do nothing
        } else {
          playerX += 0.1;
        }
      });
    });
  }

  void fireMissle() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        missleY -= 0.1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        }
        if (event.isKeyPressed(LogicalKeyboardKey.space)) {
          fireMissle();
        }
      },
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.amber[100],
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment(missleX, missleY),
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    MyPlayer(
                      playerX: playerX,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    icon: Icons.arrow_back,
                    function: moveLeft,
                  ),
                  MyButton(
                    icon: Icons.arrow_upward,
                    function: fireMissle,
                  ),
                  MyButton(
                    icon: Icons.arrow_forward,
                    function: moveRight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
