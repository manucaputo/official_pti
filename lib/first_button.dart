import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// from scratch

//void main() => runApp(FirstButton(idQuestion: idQuestion,)); // for functions who had only one argument

void main() {
  var idQuestion;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstButton(
      idQuestion: idQuestion,
    ),
  ));
}

class FirstButton extends StatefulWidget {
  var idQuestion;
  FirstButton({
    required this.idQuestion,
  });

  @override
  State<FirstButton> createState() => _MyAppState(idQuestion); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<FirstButton> {
  var _questionIndex = 0;
  var _totalScore = 0;
  var idQuestion;
  final url = "http://192.168.1.100:3000/api/duel";
  var _postsJson = [];
  var idDuel;

  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NDk3NjY5NjMsImV4cCI6MTY4NTc2Njk2M30.P1mIica2XmcowNwLwiss0g6Mhf_eniSjxcN7wFnmTjs"
  };

  _MyAppState(this.idQuestion);


  postDuel() async {
    try {
      String json = '{ "idQuestion" : "3" }';
      final response =
          await http.post(Uri.parse(url), body: json, headers: headers);
      final jsonData = jsonDecode(response.body);
      print(jsonData["duelId"]);
      idDuel = jsonData["duelId"];
      print(idDuel);
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    //postDuel();
    print(idQuestion);
  }

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
