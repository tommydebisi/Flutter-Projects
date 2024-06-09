import 'package:flutter/material.dart';

class StyledWhiteText extends StatelessWidget {
  // constructor function - a class can have multiple constructor functions
  // add positional parameter in front of named
  const StyledWhiteText(this.value, {super.key});

  // another constructor
  // const StyledWhiteText.color({super.key}) : value = "let's go";

  // class variable - use final because there won't cahnge to value again after initialization
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
