class QuizQuestion {
  QuizQuestion(this.question, this.answers);

  String question;
  List<String> answers;

  // function copy list, shuffle answers and return mutated list
  List<String> getShuffledAnswers() {
    final newList = List.of(answers);
    newList.shuffle();
    return newList;
  }
}
