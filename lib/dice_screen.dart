import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen>
    with SingleTickerProviderStateMixin {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  late AnimationController _controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    animation.addListener(() {
      setState(() {});
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
        });
        // print('Completed');
        _controller.reverse();
      }
    });
  }

  void roll() {
    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Dice_Rolling'),
        ),
      ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onDoubleTap: roll,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Image(
                  height: 200 - (animation.value) * 200,
                  image: AssetImage('assets/images/dice-png-$leftDiceNumber.png'),),
              ),
            ),
           ),
            Expanded(
              child: GestureDetector(
                onDoubleTap: roll,
                child: Padding(
                 padding: const EdgeInsets.all(13),
                  child: Image(
                    height: 200 - (animation.value) * 200,
                    image: AssetImage('assets/images/dice-png-$rightDiceNumber.png'),),
                ),
              ),
            ),
            ],//children
          ),
          const SizedBox(height: 20,width: 180,),
            OutlinedButton(
    style: TextButton.styleFrom(
    textStyle: const TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
    backgroundColor: Colors.tealAccent,
    foregroundColor: Colors.redAccent,
    ),
    onPressed: roll,
    child: const Text('Roll'),
    ),
        ],
      ),
    ),
    );
  }
}

