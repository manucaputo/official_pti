import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:official_pti/Resultats/resultat.dart';
import 'dart:convert';
import '../Resultats/result_student.dart';
import '../connexion/token.dart';

// from scratch

void main() {
  var idUser;
  var firstName;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListDuel(idUser: idUser, firstName: firstName),
  ));
}

class ListDuel extends StatefulWidget {
  var idUser;
  var firstName;
  ListDuel({
    required this.idUser,
    required this.firstName,
  });
  @override
  State<ListDuel> createState() => _MyAppState(idUser,
      firstName); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<ListDuel> {
  var idUser;
  var firstName;
  final url = "/result/student";
  var _postsJson = [];
  final _postsJson2 = [
    {
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
    },
    {
      "player": {
        "id": 5,
        "score": 4,
        "Q1": "x=1",
        "Q2": "x=2",
        "Q3": "x=3",
        "Q4": "x=4",
        "Q5": "x=5",
        "DuelId": 3,
        "UserId": 4,
        "idQuestion": 1
      },
      "adversaire": {
        "score": "...",
        "Q1": "...",
        "Q2": "...",
        "Q3": "...",
        "Q4": "...",
        "Q5": "...",
        "firstName": "En attente"
      }
    }
  ];
  _MyAppState(this.idUser, this.firstName);
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };

  getReply() async {
    print(Token.url + url + "/" + idUser.toString());
    try {
      final response = await http.get(
          Uri.parse(Token.url + url + "/" + idUser.toString()),
          headers: headers);
      final jsonData = jsonDecode(response.body) as List;
      _postsJson = jsonData;
      print(_postsJson);
      setState(() {
        _postsJson = jsonData;
        print(_postsJson);
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    getReply();
  }

  @override // It already exists but we override with our own method --> To make the code more clear
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(firstName),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: _postsJson2.length,
        itemBuilder: (BuildContext context, int index) {
          final post = _postsJson2[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Column(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                      child: ElevatedButton(
                        child: const Text("Détails",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color.fromRGBO(13, 78, 5, 0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
                                    ResultStudent(resultat: post)),
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
                          child: Text(
                            "Score de l'élève\n\n${post["player"]!["score"]}/5",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(
                        children: [
                          Text(
                            "Score de ${post["adversaire"]!["firstName"]}\n\n${post["adversaire"]!["score"]}/5",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          );
        },
      ),
    );
  }
}
