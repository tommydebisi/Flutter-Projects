import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // ensure the device orientation is locked
  // WidgetsFlutterBinding.ensureInitialized();
  // lock the device orientation for the app
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  runApp(const MaterialApp(
    home: Expenses(),
  ));
  // });
}
