import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/questions.dart';
import 'questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers, // chosenAnswers - named argument
    required this.onRestart, 
  });

  final void Function() onRestart;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      // loop body
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length; // returns Iterable

    return SizedBox(
      width: double.infinity, // uses as much width as possible
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // centers widgets vertically
          children: [
            Text(
              '$numTotalQuestions sorudan $numCorrectQuestions doğru cevapladınız!',
              style: GoogleFonts.manrope(
                color: const Color(0xFFEBEFFB), // blue tint
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: onRestart,
                  icon: const Icon(
                    Icons.refresh,
                    color: Color(0xFFFFFFFF),
                  ),
                  label: Text(
                    'Tekrar Oyna!',
                    style: GoogleFonts.manrope(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
