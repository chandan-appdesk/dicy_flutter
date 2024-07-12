import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Hello, World!',
    home: Scaffold(
        backgroundColor: Colors.indigo[500],
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text(
            'Dicey Dice!',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const SafeArea(
          child: DicePage(),
        )),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    leftDiceNumber = updateDiceNumber();
                    rightDiceNumber = updateDiceNumber();
                  });
                },
                child: Image(
                  image: AssetImage('images/dice$leftDiceNumber.png'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      leftDiceNumber = updateDiceNumber();
                      rightDiceNumber = updateDiceNumber();
                    });
                  },
                  child: Image(
                    image: AssetImage("images/dice$rightDiceNumber.png"),
                  ),
                )),
          ),
        ],

      ),
    );
  }
}

int updateDiceNumber() {
  return Random().nextInt(6) + 1; // Generates a random number between 1 and 6
}
