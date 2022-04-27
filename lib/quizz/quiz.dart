import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(221, 229, 221, 1.0),
              radius: 70,
              child: AnimatedOpacity(
                  opacity: 0.75,
                  duration: const Duration(milliseconds: 5000),
                  child: Image.asset('assets/images/logo.png', scale: 9)),
            ),
          ),

          /*Card(
            margin:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 0),

           */
          //color: const Color.fromRGBO(13, 78, 5, 0.6),
          Card(
            margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 10),
            shape: const ContinuousRectangleBorder(
                side: BorderSide(
              width: 3,
              color: Color.fromRGBO(13, 78, 5, 0.6),
            )),
            child: Question(
              questions[questionIndex]['questionText'] as String,
            ),
          ),

          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            // "..."  take a list and pull all the values in that list out of them and add it in a surrounding as individual values
            return Answer(() => answerQuestion(answer['score'], answer['text']),
                answer['text'] as String);
          }).toList()
        ],
      ),
    );
  }
}
