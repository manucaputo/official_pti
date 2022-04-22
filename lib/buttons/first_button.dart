import 'package:flutter/material.dart';
import '../quizz/quiz.dart';
import '../quizz/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import '../connexion/token.dart';

// from scratch

//void main() => runApp(FirstButton(idQuestion: idQuestion,)); // for functions who had only one argument

void main() {
  var idQuestion;
  var idDuel;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstButton(
      idQuestion: idQuestion,
      idDuel : idDuel
    ),
  ));
}

class FirstButton extends StatefulWidget {
  var idQuestion;
  var idDuel;
  FirstButton({
    required this.idQuestion,
    required this.idDuel
  });

  @override
  State<FirstButton> createState() => _MyAppState(
      idQuestion,idDuel); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<FirstButton> {
  var _questionIndex = 0;
  var _totalScore = 0;
  var idQuestion;
  final url = "/duel";
  var _postsJson = [];
  var idDuel;
  List<Map<String, Object>> _questions = [];

  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization":
        Token.token
  };

  _MyAppState(this.idQuestion,this.idDuel);

  postDuel() async {
    try {
      Map<String, int> json = { "idQuestion" : idQuestion } ;
      String json2= jsonEncode(json);


      final response = await http.post(Uri.parse(Token.url+url), body: json2, headers: headers);
      final jsonData = jsonDecode(response.body);
      idDuel = jsonData["duelId"];
      print("nouveau id duel"+"$idDuel");
    } catch (err) {print(err);}
  }

  @override
  void initState() {
    super.initState();
    print("idduel de base"+"$idDuel");
    print("idquestion"+"$idQuestion");

    //postDuel();
    if (idQuestion == 0) {
      Random rnd;
      int min = 1;
      int max = 3;
      rnd = new Random();
      idQuestion = min + rnd.nextInt(max - min);
      print("idquestion"+"$idQuestion");
    }

    if (idQuestion == 1) {
      _questions = const [
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
    }

    if (idQuestion == 2) {
      _questions = const [
        // creation of a MAP (key : value)
        {
          'questionText': 'x + 2 = 5 ?',
          'answers': [
            {'text': '3', 'score': 1},
            {'text': '6', 'score': 0},
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
    }

    if(idDuel == 0)
    {

      postDuel();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

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
            backgroundColor: const Color.fromRGBO(0, 0, 255, 0.55),
          ),
          body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(241, 240, 239, 0),
                    Color.fromRGBO(175, 175, 164, 0),
                  ],
                )),
                child: _questionIndex < _questions.length //if
                    ? Quiz(
                        answerQuestion: _answerQuestion,
                        questionIndex: _questionIndex,
                        questions: _questions)
                    : Result(_totalScore, _resetQuiz),
              ),
          ),
        );
  }
}
