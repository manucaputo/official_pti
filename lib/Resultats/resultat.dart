import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  //late MediaQueryData queryData;
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

    if (_postsJson2["player"]!["idQuestion"] == 1) {
      answersDuel = [
        "x = - 8/5",
        "Aucune des propositions",
        "x = 8",
        "-24x + 33 = -3x + 68",
        "x = ∅"
      ];
    }

    if (_postsJson2["player"]!["idQuestion"] == 2) {
      answersDuel = [
        "x = 14",
        "12t + 8 = 3t + 10",
        "x = 4",
        "x = -1/2",
        "x = ℝ"
      ];
    }

    /*

    if (_postsJson2["player"]!["idQuestion"] == 3) {
      answersDuel = ["11", "12", "13", "14", "15"];
    }

     */

    if (_postsJson2["player"]!["idQuestion"] == 1) {
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
            {'text': '-21x = -35', 'score': 0},
            {'text': '-24x + 33 = -3x + 68', 'score': 1},
            {'text': '24x -33 = 3x + 68', 'score': 0},
            {'text': '-24x + 33 = - 3x - 68', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 0},
          ]
        },

        {
          'questionText':
              '3 (x + 1) – (x – 9) + (x + 3) \n= (x + 4) + (x + 2) – (11 – x) ?',
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
      questions = [
        // creation of a MAP (key : value)
        {
          'questionText': "2x / 7 = 4 ?",
          'answers': [
            {'text': 'x = -14', 'score': 0},
            {'text': 'x = - 7', 'score': 0},
            {'text': 'x = ∅', 'score': 0},
            {'text': 'x = 14', 'score': 1},
            {'text': 'x = 12', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 0},
          ]
          // first element list = pos 0
        },

        {
          'questionText':
              'Parmis les différentes propositions, sélectionne l\'équation du premier degré ayant pour solution \n\nt = -2 ?',
          'answers': [
            {'text': '25t - 12 = -60', 'score': 0},
            {'text': '3t = -2', 'score': 0},
            {'text': '100t = 10t - 180', 'score': 1},
            {'text': '6t - 4 = 8', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 0},
            {'text': '12t + 8 = 3t + 10', 'score': 1},
          ]
        },

        {
          'questionText': '3x - 4 = 8 ?',
          'answers': [
            {'text': 'x = 4', 'score': 1},
            {'text': 'x = -2', 'score': 0},
            {'text': 'x = 2', 'score': 0},
            {'text': 'x = ∅', 'score': 0},
            {'text': 'x = -4', 'score': 0},
            {'text': 'x = ℝ', 'score': 0},
          ]
        },
        {
          'questionText': '5(x − 1) + 3(2 − x) = 0 ?',
          'answers': [
            {'text': 'x = 2', 'score': 0},
            {'text': 'Aucune des propositions', 'score': 0},
            {'text': 'x = -2', 'score': 0},
            {'text': 'x = 4', 'score': 0},
            {'text': 'x = -4', 'score': 0},
            {'text': 'x = -1/2', 'score': 1},
          ]
        },

        {
          'questionText': '3(2x + 4) − 2x \n= 14 − 2(1 − 2x) ?',
          'answers': [
            {'text': 'x = 0', 'score': 0},
            {'text': 'x = ℝ', 'score': 1},
            {'text': 'x = -5', 'score': 0},
            {'text': 'x = ∅', 'score': 0},
            {'text': '5', 'score': 0},
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
              '3 (x + 1) – (x – 9) + (x + 3) \n= (x + 4) + (x + 2) – (11 – x) ?',
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

    //queryData = MediaQuery.of(context);

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
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0)),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: ListTile(
                      tileColor: const Color.fromRGBO(221, 229, 221, 1.0),
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(13, 78, 5, 0.75),
                        radius: 26,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text(
                              "Q1",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        questions[0]['questionText'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: ListTile(
                      tileColor: const Color.fromRGBO(221, 229, 221, 1.0),
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(13, 78, 5, 0.75),
                        radius: 26,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text(
                              "Q2",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        questions[1]['questionText'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: ListTile(
                      tileColor: const Color.fromRGBO(221, 229, 221, 1.0),
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(13, 78, 5, 0.75),
                        radius: 26,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text(
                              "Q3",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        questions[2]['questionText'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: ListTile(
                      tileColor: const Color.fromRGBO(221, 229, 221, 1.0),
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(13, 78, 5, 0.75),
                        radius: 26,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text(
                              "Q4",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        questions[3]['questionText'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: ListTile(
                      tileColor: const Color.fromRGBO(221, 229, 221, 1.0),
                      leading: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(13, 78, 5, 0.75),
                        radius: 26,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text(
                              "Q5",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        questions[4]['questionText'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      //defaultColumnWidth: FixedColumnWidth(120.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3),
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: const [
                              Text('Réponses correctes',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center)
                            ]),
                          ),
                          Column(children: const [
                            Text(
                              'Mes réponses',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )
                          ]),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Text(
                                'Réponses de '
                                '${post["adversaire"]!["firstName"]}',
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(children: [
                              Text(
                                answersDuel[0],
                                style: const TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ),
                          Column(children: [
                            if (answersDuel[0] == post["player"]!["Q1"])
                              Text(
                                '${post["player"]!["Q1"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green),
                              )
                            else
                              Text(
                                '${post["player"]!["Q1"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.red),
                              )
                          ]),
                          Column(children: [
                            if (answersDuel[0] == post["adversaire"]!["Q1"])
                              Text(
                                '${post["adversaire"]!["Q1"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green),
                              )
                            else
                              Text(
                                '${post["adversaire"]!["Q1"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.red),
                              )
                          ]),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(children: [
                              Text(
                                answersDuel[1],
                                style: const TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ),
                          Column(children: [
                            if (answersDuel[1] == post["player"]!["Q2"])
                              Text(
                                '${post["player"]!["Q2"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green),
                              )
                            else
                              Text(
                                '${post["player"]!["Q2"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.red),
                              ),
                          ]),
                          Column(children: [
                            if (answersDuel[1] == post["adversaire"]!["Q2"])
                              Text(
                                '${post["adversaire"]!["Q2"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green),
                              )
                            else
                              Text(
                                '${post["adversaire"]!["Q2"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.red),
                              )
                          ]),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(children: [
                              Text(
                                answersDuel[2],
                                style: const TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ),
                          Column(children: [
                            if (answersDuel[2] == post["player"]!["Q3"])
                              Text('${post["player"]!["Q3"]}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.green))
                            else
                              Text('${post["player"]!["Q3"]}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.red))
                          ]),
                          Column(children: [
                            if (answersDuel[2] == post["adversaire"]!["Q3"])
                              Text(
                                '${post["adversaire"]!["Q3"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green),
                              )
                            else
                              Text(
                                '${post["adversaire"]!["Q3"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.red),
                              )
                          ]),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(children: [
                              Text(
                                answersDuel[3],
                                style: const TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ),
                          Column(children: [
                            if (answersDuel[3] == post["player"]!["Q4"])
                              Text('${post["player"]!["Q4"]}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.green))
                            else
                              Text('${post["player"]!["Q4"]}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.red))
                          ]),
                          Column(children: [
                            if (answersDuel[3] == post["adversaire"]!["Q4"])
                              Text(
                                '${post["adversaire"]!["Q4"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green),
                              )
                            else
                              Text(
                                '${post["adversaire"]!["Q4"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.red),
                              )
                          ]),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(children: [
                              Text(
                                answersDuel[4],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                              )
                            ]),
                          ),
                          Column(children: [
                            if (answersDuel[4] == post["player"]!["Q5"])
                              Text('${post["player"]!["Q5"]}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.green))
                            else
                              Text('${post["player"]!["Q5"]}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.red))
                          ]),
                          Column(children: [
                            if (answersDuel[4] == post["adversaire"]!["Q5"])
                              Text(
                                '${post["adversaire"]!["Q5"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green),
                              )
                            else
                              Text(
                                '${post["adversaire"]!["Q5"]}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.red),
                              )
                          ]),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
