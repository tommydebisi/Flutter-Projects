import 'package:flutter/material.dart';
import 'package:question_app/models/data/questions.dart';
import 'package:question_app/questions_screen.dart';
import 'package:question_app/results_screen.dart';
import 'package:question_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> answerList = [];
  String activePage = 'start-screen';

  // runs when class is initialized
  // @override
  // void initState() {
  //   // pass in function with state
  //   activePage = StartScreen(switchScreen);

  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activePage = 'questions-screen';
    });
  }

  // store selected answers
  void onSelectedAnswers(String answer) {
    answerList.add(answer);

    if (answerList.length == questions.length) {
      // reset the screen to start screen after answers have been answered
      setState(() {
        // reset answerList to avoid errors in logic
        // answerList = [];
        activePage = 'results-screen';
      });
    }
  }

  void resetAnswers(List<String> answers) {
    // reset answers list to empty
    answers.clear();
    setState(() {
      activePage = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    switch (activePage) {
      case 'questions-screen':
        // updating state using if statements
        screenWidget = QuestionsScreen(
          onSelected: onSelectedAnswers,
        );
        break;
      case 'results-screen':
        // pass the list of answers
        screenWidget = ResultsScreen(
          pickedAnswers: answerList,
          resetAnswer: resetAnswers,
        );
        break;
      default:
        screenWidget = StartScreen(switchScreen);
    }
    // if (activePage == 'questions-screen') {
    // }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              // start from top to bottom
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 85, 44, 155),
                Color.fromARGB(255, 123, 64, 224),
              ],
            ),
          ),
          // using tenary operation to update state
          child: screenWidget,
          // child: activePage == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),
        ),
      ),
    );
  }
}
