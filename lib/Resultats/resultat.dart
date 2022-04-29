import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import '../buttons/third_button.dart';
import '../connexion/token.dart';

void main() {
  var resultat;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ResultatButton(
      resultat: resultat,
    ),
  ));
}

class ResultatButton extends StatefulWidget {
  var resultat;

  ResultatButton({
    required this.resultat,
  });
  @override
  State<ResultatButton> createState() => _MyAppState(
      resultat); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<ResultatButton> {
  var resultat;

  _MyAppState(this.resultat);
  final url = "http://192.168.1.100:3000/api/result/my";
  var _postsJson = [];
  var answersDuel = [];
  List<Map<String, Object>> questions = [];
  final _postsJson2 = {
    "player": {
      "id": 4,
      "score": 4,
      "Q1": "x=1",
      "Q2": "x=2",
      "Q3": "x=3",
      "Q4": "x=4",
      "Q5": "x=5",
      "DuelId": 2,
      "UserId": 4,
      "idQuestion": 2,
    },
    "adversaire": {
      "id": 2,
      "score": 4,
      "Q1": "x=1",
      "Q2": "x=2",
      "Q3": "x=3",
      "Q4": "x=4",
      "Q5": "x=5",
      "DuelId": 2,
      "UserId": 1,
      "idQuestion": 2,
      "firstName": "Adrien"
    }
  };

  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };

  getReply() async {
    try {
      final response =
          await http.get(Uri.parse(Token.url + url), headers: headers);
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
        print(_postsJson[0]["player"]["id"]);
      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    getReply();
  }

  var a = 2;

  @override // It already exists but we override with our own method --> To make the code more clear
  Widget build(BuildContext context) {
    final post = _postsJson2;

    if (_postsJson2["adversaire"]!["idQuestion"] == 1) {
      answersDuel = ["1", "2", "3", "4", "5"];
    }

    if (_postsJson2["adversaire"]!["idQuestion"] == 2) {
      answersDuel = ["6", "7", "8", "9", "10"];
    }

    if (_postsJson2["adversaire"]!["idQuestion"] == 3) {
      answersDuel = ["11", "12", "13", "14", "15"];
    }

    if (_postsJson2["adversaire"]!["idQuestion"] == 1) {
      questions = const [
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
          'questionText': '(x + 3)(x + 5) \n=\n(x + 1)(x + 9) ?',
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
          'questionText':
              '8(4 − 3x) + 1 \n=\n53 − 3(x − 5)\n\nQuelle proposition est correctement développée ?',
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
          'questionText':
              '3 (x + 1) – (x – 9) + (x + 3) \n=\n(x + 4) + (x + 2) – (11 – x) ?',
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

    if (_postsJson2["adversaire"]!["idQuestion"] == 2) {
      questions = const [
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
          'questionText':
              'Quelle proposition est correctement développée ?\n8(4 − 3x) + 1 = 53 − 3(x − 5)',
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
          'questionText':
              '3 (x + 1) – (x – 9) + (x + 3) = (x + 4) + (x + 2) – (11 – x) ?',
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

    if (_postsJson2["adversaire"]!["idQuestion"] == 3) {
      questions = const [
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
          'questionText': '(x + 3)(x + 5) \n=\n(x + 1)(x + 9) ?',
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
          'questionText':
              '8(4 − 3x) + 1 \n=\n53 − 3(x − 5)\n\nQuelle proposition est correctement développée ?',
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
          'questionText':
              '3 (x + 1) – (x – 9) + (x + 3) \n=\n(x + 4) + (x + 2) – (11 – x) ?',
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

    final appBar = AppBar(
      title: const Text('Détails des questions/réponses'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: appBar,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromRGBO(13, 78, 5, 0.75),
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: FittedBox(
                              child: Text(
                                'Q 1',
                                //answersDuel[index],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              questions[0]['questionText'] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    //subtitle: Text(''),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromRGBO(13, 78, 5, 0.75),
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: FittedBox(
                              child: Text(
                                'Q 2',
                                //answersDuel[index],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              questions[1]['questionText'] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    //subtitle: Text(''),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromRGBO(13, 78, 5, 0.75),
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: FittedBox(
                              child: Text(
                                'Q 3',
                                //answersDuel[index],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              questions[2]['questionText'] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    //subtitle: Text(''),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromRGBO(13, 78, 5, 0.75),
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: FittedBox(
                              child: Text(
                                'Q 4',
                                //answersDuel[index],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              questions[3]['questionText'] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    //subtitle: Text(''),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromRGBO(13, 78, 5, 0.75),
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: FittedBox(
                              child: Text(
                                'Q 5',
                                //answersDuel[index],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(
                              questions[4]['questionText'] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    //subtitle: Text(''),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Résultats attendus',style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                        ),),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Mes réponses',style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                        ),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Réponses de ''${post["adversaire"]!["firstName"]}',style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                        ),),
                      ),
                  ],),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('${post["player"]!["Q1"]}',style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('${post["player"]!["Q1"]}',style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('${post["adversaire"]!["Q1"]}',style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                        ),),
                      ),
                    ],)
                ],
              )
            ]))));
  }
}
