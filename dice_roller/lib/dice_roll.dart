import 'dart:math';
import 'package:flutter/material.dart';

// to make setting state more efficient, init Random outside
final Random rand = Random();

// stateful widget requires interaction with two classes
class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() {
    return _DiceRollState();
  }
}

class _DiceRollState extends State<DiceRoll> {
  int imgNumber = 2;

  void rollDice() {
    // notify framework that there's a change that will impact UI
    // letting it to run build again
    setState(() {
      // random number in range 1 <= x =< 6
      imgNumber = rand.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // reduce column size to not fill the whole vertical space
      mainAxisSize: MainAxisSize.min,
      children: [
        // adding image to app
        Image.asset(
          'assets/images/dice-$imgNumber.png',
          width: 150,
        ),
        // a box that is set manual and if there is an overflow it cuts the text/child widget in it
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // one can add padding to all sides (EdgeInsets.all()) or a particular side of a button
            // padding: const EdgeInsets.only(
            //   top: 20,
            // ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 20,
            ),
          ),
          child: const Text("Roll dice"),
        )
      ],
    );
  }
}
