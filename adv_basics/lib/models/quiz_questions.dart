
class QuizQuestion  {
  final String question;
  final List<String> options;

  const QuizQuestion(this.question, this.options);
  List<String> getShuffledList() => List.of(options)..shuffle();


 
}