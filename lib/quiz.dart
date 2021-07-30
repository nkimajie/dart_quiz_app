import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

      Quiz({
        required this.questions,
        required this.answerQuestion,
        required this.questionIndex,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText']?.toString() ?? '',
        ),
        // the spreed operator represent three dot ... it take a list and pull
        // out all items on the list and add them as individual values
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']?.toString() ?? '');
        }).toList()
      ],
    );
  }
}
