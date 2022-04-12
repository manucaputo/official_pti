import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;


  Quiz(
      {required this.questions,
        required this.answerQuestion,
        required this.questionIndex});


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,


      children: [


        Card(
          child: Question(
            questions[questionIndex]['questionText'] as String,
          ),
        ),


        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          // "..."  take a list and pull all the values in that list out of them and add it in a surrounding as individual values
          return Answer(
                  () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()


      ],


    );


  }
}
