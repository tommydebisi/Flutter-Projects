import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:question_app/answer_button.dart';
import 'package:question_app/models/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelected,
  });

  // function to store selected answers
  final void Function(String answer) onSelected;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // to access values in the class above use "widget"
  int currentQuestionIndex = 0;

  void nextQuestion(String answer) {
    widget.onSelected(answer);
    setState(() {
      // increment current question by 1 to change question
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      // alt method to make child take as much space needed
      width: double.infinity,
      child: Container(
        // give margin all around
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            // use spread to return single elements in a list/iterable
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  text: answer,
                  onTap: () {
                    // pass in the answer and save the selected answer
                    nextQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
