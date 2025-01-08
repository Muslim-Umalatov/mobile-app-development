class QuizQuestion {
  const QuizQuestion(this.text, this.answers); // constructor
  
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    final shuffledList = List.of(answers); // copy the answers list to the shuffledList
    shuffledList.shuffle(); // shuffle its items
    return shuffledList; // return changed list
  }
}