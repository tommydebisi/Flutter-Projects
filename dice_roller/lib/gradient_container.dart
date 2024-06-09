import 'package:first_app/dice_roll.dart';
import 'package:flutter/material.dart';
// import 'package:first_app/styled_text.dart';

// using variables
var beginAlignment = Alignment.topCenter;
var endAlignment = Alignment.bottomCenter;

void rollDice() {}

// To define custom widgets, use class
class GradientContainer extends StatelessWidget {
  // construction function extending another class uses super
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  // dart automatically runs build when running the UI
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // By default goes from left to right
        gradient: LinearGradient(
          colors: colors,
          // set gradient to start from top to bottom
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        // perform the stateful action
        child: DiceRoll(),
      ),
    );
  }
}
