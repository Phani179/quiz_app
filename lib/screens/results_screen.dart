import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.choosedAnswers, required this.onRestart});
  final List<String> choosedAnswers;
  List<Map<String, Object>> summary = [];
  void Function() onRestart;

  List<Map<String, Object>> getQuestionsSummary() {
    for (int i = 0; i < choosedAnswers.length; i++) {
      summary.add({
        'question' : questions[i].question,
        'question_index' : i+1,
        'user_answer' : choosedAnswers[i],
        'correct_answer' : questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnsweredQuestions = 0;
    int totalQuestions = questions.length;
    correctAnsweredQuestions = summary.where((element) => element['user_answer'] == element['correct_answer']).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                'You answered $correctAnsweredQuestions out of $totalQuestions questions correctly!',
              style: GoogleFonts.openSans(
                color: const Color(0x99FFFFFF),
                fontSize: 18
              ),
              textAlign: TextAlign.center,
        ),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(summaryData: getQuestionsSummary()),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.refresh,
                color: Color(0x99FFFFFF),
              ),
              label: const Text(
                'Retake Test!',
                style: TextStyle(
                  color: Color(0x99FFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
