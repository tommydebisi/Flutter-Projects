import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

// const helps dart to improve runtime performance, allows data to reuse value in memory and eliminating duplication in memory
void main() {
  const colors = [
    Color.fromARGB(255, 102, 27, 4),
    Color.fromARGB(255, 154, 43, 9),
    Color.fromARGB(255, 196, 51, 7),
    Color.fromARGB(255, 249, 68, 13),
  ];
  // use core widget to create basic interface - MaterialApp
  runApp(
    const MaterialApp(
      home: Scaffold(
        // configurations object (non-widget) like background color
        // backgroundColor: Color.fromARGB(255, 143, 46, 16),
        body: GradientContainer(colors),
      ),
    ),
  );
}
