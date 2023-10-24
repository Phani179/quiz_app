import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (data) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['user_answer'] == data['correct_answer'] ? Colors.green : Colors.redAccent,
                      ),
                        child: Text(data['question_index'].toString())
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['question'].toString(), style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 13
                          ),),
                          const SizedBox(height: 5,),
                          Text(data['user_answer'].toString(), style: const TextStyle(color: Color(
                              0x9306F4E9)),),
                          const SizedBox(height: 2,),
                          Text(data['correct_answer'].toString(),
                          style: const TextStyle(color: Color(0xDB3DCE3F),),),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
