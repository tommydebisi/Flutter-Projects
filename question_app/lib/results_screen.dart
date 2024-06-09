import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:question_app/models/data/questions.dart';
import 'package:question_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.pickedAnswers,
    required this.resetAnswer,
  });

  final List<String> pickedAnswers;
  final void Function(List<String> answers) resetAnswer;

  // gets all the info we need to populate the widgets below
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> info = [];

    // use for to loop through choosen answers and get needed info
    for (int i = 0; i < pickedAnswers.length; i++) {
      info.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': pickedAnswers[i],
        },
      );
    }
    return info;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final questionsNum = questions.length;
    // 'where' is for filtering, by return a bool a data stays or remain in list
    final correctAnswersNum = summary.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      // alt method to make child take as much space needed
      width: double.infinity,
      child: Container(
        // give margin all around
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have answered $correctAnswersNum out of $questionsNum correctly!",
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 185, 149, 248),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(getSummaryData()),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: () {
                resetAnswer(pickedAnswers);
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.restart_alt),
              label: const Text("Restart Quiz!"),
            ),
          ],
        ),
      ),
    );
  }
}
