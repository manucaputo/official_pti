import 'package:flutter/material.dart';
import '../quizz/quiz.dart';
import '../quizz/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import '../connexion/token.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// from scratch

//void main() => runApp(FirstButton(idQuestion: idQuestion,)); // for functions who had only one argument

void main() {
  var idQuestion;
  var idDuel;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstButton(idQuestion: idQuestion, idDuel: idDuel),
  ));
}

class FirstButton extends StatefulWidget {
  var idQuestion;
  var idDuel;

  FirstButton({required this.idQuestion, required this.idDuel});

  @override
  State<FirstButton> createState() => _MyAppState(idQuestion,
      idDuel); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<FirstButton> {
  var _questionIndex = 0;
  var _totalScore = 0;
  var _response = [];
  var idQuestion;
  var _postsJson = [];
  var idDuel;
  final url = "/duel";
  List<String> list = [];

  List<Map<String, Object>> _questions = [];

  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };

  _MyAppState(this.idQuestion, this.idDuel);

  postDuel() async {
    try {
      Map<String, int> json = {"idQuestion": idQuestion};
      String json2 = jsonEncode(json);

      final response = await http.post(Uri.parse(Token.url + url),
          body: json2, headers: headers);
      final jsonData = jsonDecode(response.body);
      idDuel = jsonData["duelId"];
      print("nouveau id duel" + "$idDuel");
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    print("idduel de base" + "$idDuel");
    print("idquestion" + "$idQuestion");

    //postDuel();
    if (idQuestion == 0) {
      Random rnd;
      int min = 1;
      int max = 4;
      rnd = new Random();
      idQuestion = min + rnd.nextInt(max - min);
      print("idquestion" + "$idQuestion");
    }

    if (idQuestion == 1) {
      _questions = const [
        // creation of a MAP (key : value)
        {
          'questionText': '5x + 8 = 0 ?',
          'answers': [
            {'text': 'x = 5/8', 'score': 0},
            {'text': 'x = - 8/5', 'score': 1},
            {'text': 'x = - 5/8', 'score': 0},
            {'text': 'x = 8/5', 'score': 0},
            {'text': 'x = ∅', 'score': 0},
            {'text': 'Aucune des propositions n\'est correcte', 'score': 0},
          ]
          // first element list = pos 0
        },

        {
          'questionText': '(x + 3)(x + 5) = (x + 1)(x + 9) ?',
          'answers': [
            {'text': 'x = ∅', 'score': 0},
            {'text': 'x = 4', 'score': 0},
            {'text': 'x = 6', 'score': 0},
            {'text': 'x = ℝ', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 1},
            {'text': 'x = - 3', 'score': 0},
          ]
        },

        {
          'questionText': '2x + 3 = 3x − 5 ?',
          'answers': [
            {'text': 'x = 4', 'score': 0},
            {'text': 'x = ∅', 'score': 0},
            {'text': 'x = - 4', 'score': 0},
            {'text': 'x = 2', 'score': 0},
            {'text': 'Aucune des propositions n\'est correcte', 'score': 0},
            {'text': 'x = 8', 'score': 1},

          ]
        },
        {
          'questionText': '8(4 − 3x) + 1 = 53 − 3(x − 5)\n\nQuelle proposition est correctement développée ?',
          'answers': [

            {'text': '32 - 24x = 48 - 3x', 'score': 0},
            {'text': '-21x = 35', 'score': 1},
            {'text': '-24x + 33 = -3x + 68', 'score': 1},
            {'text': '24x -33 = 3x + 68', 'score': 0},
            {'text': '-24x + 33 = - 3x - 68', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 0},
          ]
        },




        {
          'questionText': '3 (x + 1) – (x – 9) + (x + 3) = (x + 4) + (x + 2) – (11 – x) ?',
          'answers': [
            {'text': 'x = ∅', 'score': 1},
            {'text': 'x = 5', 'score': 0},
            {'text': 'x = -5', 'score': 0},
            {'text': 'x = ℝ', 'score': 0},
            {'text': '18', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 0},
          ]
        },

      ];
    }



    if (idQuestion == 2) {
      _questions = const [
        // creation of a MAP (key : value)
        {
          'questionText': '5x + 8 = 0 ?',
          'answers': [
            {'text': 'x = 5/8', 'score': 0},
            {'text': 'x = - 8/5', 'score': 1},
            {'text': 'x = - 5/8', 'score': 0},
            {'text': 'x = 8/5', 'score': 0},
            {'text': 'x = ∅', 'score': 0},
            {'text': 'Aucune des propositions n\'est correcte', 'score': 0},
          ]
          // first element list = pos 0
        },

        {
          'questionText': '(x + 3)(x + 5) = (x + 1)(x + 9) ?',
          'answers': [
            {'text': 'x = ∅', 'score': 0},
            {'text': 'x = 4', 'score': 0},
            {'text': 'x = 6', 'score': 0},
            {'text': 'x = ℝ', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 1},
            {'text': 'x = - 3', 'score': 0},
          ]
        },

        {
          'questionText': '2x + 3 = 3x − 5 ?',
          'answers': [
            {'text': 'x = 4', 'score': 0},
            {'text': 'x = ∅', 'score': 0},
            {'text': 'x = - 4', 'score': 0},
            {'text': 'x = 2', 'score': 0},
            {'text': 'Aucune des propositions n\'est correcte', 'score': 0},
            {'text': 'x = 8', 'score': 1},

          ]
        },
        {
          'questionText': '8(4 − 3x) + 1 = 53 − 3(x − 5)\n\nQuelle proposition est correctement développée ?',
          'answers': [

            {'text': '32 - 24x = 48 - 3x', 'score': 0},
            {'text': '-21x = 35', 'score': 1},
            {'text': '-24x + 33 = -3x + 68', 'score': 1},
            {'text': '24x -33 = 3x + 68', 'score': 0},
            {'text': '-24x + 33 = - 3x - 68', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 0},
          ]
        },




        {
          'questionText': '3 (x + 1) – (x – 9) + (x + 3) = (x + 4) + (x + 2) – (11 – x) ?',
          'answers': [
            {'text': 'x = ∅', 'score': 1},
            {'text': 'x = 5', 'score': 0},
            {'text': 'x = -5', 'score': 0},
            {'text': 'x = ℝ', 'score': 0},
            {'text': '18', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 0},
          ]
        },

      ];
    }

    if (idQuestion == 3) {
      _questions = const [
        // creation of a MAP (key : value)
        {
          'questionText': '5x + 8 = 0 ?',
          'answers': [
            {'text': 'x = 5/8', 'score': 0},
            {'text': 'x = - 8/5', 'score': 1},
            {'text': 'x = - 5/8', 'score': 0},
            {'text': 'x = 8/5', 'score': 0},
            {'text': 'x = ∅', 'score': 0},
            {'text': 'Aucune des propositions n\'est correcte', 'score': 0},
          ]
          // first element list = pos 0
        },

        {
          'questionText': '(x + 3)(x + 5) = (x + 1)(x + 9) ?',
          'answers': [
            {'text': 'x = ∅', 'score': 0},
            {'text': 'x = 4', 'score': 0},
            {'text': 'x = 6', 'score': 0},
            {'text': 'x = ℝ', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 1},
            {'text': 'x = - 3', 'score': 0},
          ]
        },

        {
          'questionText': '2x + 3 = 3x − 5 ?',
          'answers': [
            {'text': 'x = 4', 'score': 0},
            {'text': 'x = ∅', 'score': 0},
            {'text': 'x = - 4', 'score': 0},
            {'text': 'x = 2', 'score': 0},
            {'text': 'Aucune des propositions n\'est correcte', 'score': 0},
            {'text': 'x = 8', 'score': 1},

          ]
        },
        {
          'questionText': '8(4 − 3x) + 1 = 53 − 3(x − 5)\n\nQuelle proposition est correctement développée ?',
          'answers': [

            {'text': '32 - 24x = 48 - 3x', 'score': 0},
            {'text': '-21x = 35', 'score': 1},
            {'text': '-24x + 33 = -3x + 68', 'score': 1},
            {'text': '24x -33 = 3x + 68', 'score': 0},
            {'text': '-24x + 33 = - 3x - 68', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 0},
          ]
        },




        {
          'questionText': '3 (x + 1) – (x – 9) + (x + 3) = (x + 4) + (x + 2) – (11 – x) ?',
          'answers': [
            {'text': 'x = ∅', 'score': 1},
            {'text': 'x = 5', 'score': 0},
            {'text': 'x = -5', 'score': 0},
            {'text': 'x = ℝ', 'score': 0},
            {'text': '18', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 0},
          ]
        },

      ];
    }

    if (idDuel == 0) {
      postDuel();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      list = [];
      _response = [];
    });
  }

  void _answerQuestion(int score, String text) {
    _totalScore = _totalScore + score;
    _response.add(text);

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print("We have more questions !");
    } else {
      print("No more questions !");
      print(_response);
    }
  }

  @override // It already exists but we override with our own method --> To make the code more clear
  Widget build(BuildContext context) {


    final appBar = AppBar(

      title: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(
              'Bonne chance !',
              duration: const Duration(seconds: 2),
            ),
            FadeAnimatedText(
              'MixMath !',
              duration: const Duration(
                seconds: 1,
              ),
            ),
          ],
          repeatForever: true,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );




    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Container(

            child: _questionIndex < _questions.length //if
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions)
                : Result(_totalScore, _resetQuiz),
          ),
        ),
      ),
    );
  }
}

//title: const Text('Duel en cours...'),
/*title: AnimatedTextKit(animatedTexts: [
        TypewriterAnimatedText(
          'MixMath Battle...',
          textAlign: TextAlign.center,
          textStyle: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 200),
        ),
      ],


        repeatForever: true,
        pause: const Duration(milliseconds: 10),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

       */
/*
      title: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 28.0,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('MixMath...'),
            ],
          repeatForever: true,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    title: AnimatedTextKit(animatedTexts: [
        TypewriterAnimatedText(
          'Bonne chance !',
          textAlign: TextAlign.center,
          textStyle: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 200),
        ),
        TypewriterAnimatedText(
          'MixMath !',
          textAlign: TextAlign.center,
          textStyle: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 200),
        ),
      ],


        repeatForever: true,
        pause: const Duration(milliseconds: 10),
      ),

 */
