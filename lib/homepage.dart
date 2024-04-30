// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:bubbleapp/ball.dart';
import 'package:bubbleapp/button.dart';
import 'package:bubbleapp/missile.dart';
import 'package:bubbleapp/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

enum direction { LEFT, RIGHT }

class _HomepageState extends State<Homepage> {
  //player variables
  static double playerX = 0;

  //missile variables
  double missileX = playerX;
  double missileY = 1;
  double missileHeight = 10;
  bool midShot = false;

  //ball variables
  double ballX = 0.5;
  double ballY = 0;
  var ballDirection = direction.LEFT;

  //start game
  void startGame() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (ballX - 0.02 < -1) {
        ballDirection = direction.RIGHT;
      } else if (ballX + 0.02 > 1) {
        ballDirection = direction.LEFT;
      }

      if (ballDirection == direction.LEFT) {
        setState(() {
          ballX -= 0.02;
        });
      } else if (ballDirection == direction.RIGHT) {
        setState(() {
          ballX += 0.02;
        });
      }
    });
  }

  //move player left
  void moveLeft() {
    setState(() {
      if (playerX - 0.1 < -1) {
        //do nothing
      } else {
        playerX -= 0.1;
      }

      //only makes the X cordinates the same when its isn't in the middle of the shot
      if (!midShot) {
        missileX = playerX;
      }
    });
  }

  //move player right
  void moveRight() {
    setState(() {
      if (playerX + 0.1 > 1) {
        //do nothing
      } else {
        playerX += 0.1;
      }
      //only makes the X cordinates the same when its isn't in the middle of the shot
      if (!midShot) {
        missileX = playerX;
      }
    });
  }

  void fireMissile() {
    if (midShot == false) {
      Timer.periodic(const Duration(milliseconds: 20), (timer) {
        //shots fired
        midShot = true;

        //missile grows til it hits top of the screen
        setState(() {
          missileHeight += 10;
        });

        if (missileHeight > MediaQuery.of(context).size.height * 3 / 4) {
          //stop missile
          resetMissile();
          timer.cancel();
          midShot = false;
        }
      });
    }
  }

  //convert heights to cordinates
  double heightToCordinate(double height) {
    double totalHeight = MediaQuery.of(context).size.height * 3 / 4;
    double missileY = 1 - 2 * height / totalHeight;
    return missileY;
  }

  void resetMissile() {
    missileX = playerX;
    missileHeight = 10;
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
          fireMissile();
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
                    MyBall(
                      ballX: ballX,
                      ballY: ballY,
                    ),
                    MyMissile(
                      height: missileHeight,
                      missileX: missileX,
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
                    icon: Icons.play_arrow,
                    function: startGame,
                  ),
                  MyButton(
                    icon: Icons.arrow_back,
                    function: moveLeft,
                  ),
                  MyButton(
                    icon: Icons.arrow_upward,
                    function: fireMissile,
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
