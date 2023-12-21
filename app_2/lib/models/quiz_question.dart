class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  // ./map doesn't change the initial list
  // ./shuffle change the list

  List<String> getShuffleAnswers() {
    final shuffleAnswers = List.of(answers);
    shuffleAnswers.shuffle();
    return shuffleAnswers;
  }
}