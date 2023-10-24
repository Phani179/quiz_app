import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/model/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.selectAnswer, super.key});

  final void Function(String answer) selectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.selectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.question,
            style: GoogleFonts.openSans(
              fontSize: 20,
              color: const Color(0x99FFFFFF),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ...currentQuestion.getShuffledList().map((answer) => AnswerButton(
                answerText: answer,
                onTap: (){
                  answerQuestion(answer);
                },
              )),
        ],
      ),
    );
  }
}
