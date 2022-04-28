import 'package:flutter/material.dart';
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
      "idQuestion": 1
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
      "idQuestion": 1,
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
/*
    if (_postsJson2 ["adversaire"]!["firstName"] == 1) {
      answersDuel = ["1", "2","3","4","5"];
    }

    if (_postsJson2 ["adversaire"]!["firstName"] == 2) {
      answersDuel = ["6", "7","8","9","10"];
    }

    if (_postsJson2 ["adversaire"]!["firstName"] == 3) {
      answersDuel = ["11", "12","13","14","15"];
    }

 */

    final appBar = AppBar(
      title: const Text('Détails des questions/réponses'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    answersDuel = ["1", "2", "3", "4", "5"];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: appBar,
          backgroundColor: Colors.white,
          body: ListView.builder(
            // itemCount: _postsJson2.length,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              final post = _postsJson2[index];
              var index_2 = index + 1;

              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Column(children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                          child: ElevatedButton(
                            child: Text(
                                //"${post["adversaire"]!["firstName"]}",
                                answersDuel[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(13, 78, 5, 0.6),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic)),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(600, 65),
                              maximumSize: const Size(600, 65),
                              primary: const Color.fromRGBO(221, 229, 221, 1.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: const BorderSide(
                                    width: 5.0,
                                    color: Color.fromRGBO(13, 78, 5, 0.6),
                                  )),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ResultatButton(resultat: post)),
                              );
                            },
                          ),
                        )
                      ])),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: const Text(
                                  //"Score personnel : ${post["player"]!["score"]}",
                                  "bonjour",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(
                            children: const [
                              Text(
                                "bonjour",
                                //"Score de l'adversaire: ${post["adversaire"]!["score"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(
                            children: const [
                              Text(
                                "bonjour",
                                //"Score de l'adversaire: ${post["adversaire"]!["score"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

/*
                          RaisedButton(
                              child: Text("Voir les réponses "),

                              onPressed: () { Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ResultatButton(resultat: post)),
                              );}),

 */
                    ]),
              );
            },
          ),
        ));
  }
}
