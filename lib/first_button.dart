import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// from scratch

void main() => runApp(FirstButton()); // for functions who had only one argument

class FirstButton extends StatefulWidget {
  @override
  State<FirstButton> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<FirstButton> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [

    // creation of a MAP (key : value)
    {
      'questionText': 'x + 2 = 5 ?',
      'answers': [
        {'text': '3', 'score': 1},
        {'text': '2', 'score': 0},
        {'text': '4', 'score': 0},
        {'text': '1', 'score': 0}
      ]
      // first element list = pos 0
    },
    {
      'questionText': '2x - 5 = 1 ?',
      'answers': [
        {'text': '4', 'score': 0},
        {'text': '3', 'score': 1},
        {'text': '1', 'score': 0},
        {'text': '2', 'score': 0}
      ]
    },
    {
      'questionText': '3 + x = 7 ?',
      'answers': [
        {'text': '1', 'score': 0},
        {'text': '2', 'score': 0},
        {'text': '4', 'score': 1},
        {'text': '3', 'score': 0}
      ]
    },
  ];



  void _answerQuestion(int score) {

    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print("We have more questions !");
    } else {
      print("No more questions !");
    }

  }



  @override // It already exists but we override with our own method --> To make the code more clear
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(



          appBar: AppBar(
            title: Text('Duel en cours...'),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(0, 0, 255, 0.6),
          ),



          body: Container(

                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(0, 0, 255, 0.5),
                        Colors.greenAccent,
                      ],
                    )),

            child: _questionIndex < _questions.length //if
                ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
                : Result(_totalScore, _resetQuiz),
          ),


        ));
  }
}
