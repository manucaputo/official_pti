import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:official_pti/Resultats/resultat.dart';
import 'dart:convert';
import '../Resultats/result_student.dart';
import '../connexion/token.dart';

// from scratch

void main() {
  var idUser;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListDuel(
        idUser : idUser
    ),
  ));
}

class ListDuel  extends StatefulWidget {
  var idUser;
  ListDuel({
    required this.idUser,
  });
  @override
  State<ListDuel> createState() =>
      _MyAppState(idUser); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<ListDuel> {
  var idUser;
  final url = "http://192.168.1.100:3000/api/result/student";
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
        "score": "Pas encore joué",
        "Q1": "Pas de réponse",
        "Q2": "Pas de réponse",
        "Q3": "Pas de réponse",
        "Q4": "Pas de réponse",
        "Q5": "Pas de réponse",
        "firstName": "En attente"
      }
    }
  ];
  _MyAppState(this.idUser);
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };



  getReply() async {
    try {

      final response = await http.get(Uri.parse(url+idUser.toString()), headers: headers);
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;

      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    getReply();
  }

  @override // It already exists but we override with our own method --> To make the code more clear
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('MixMath'),
          ),
          body: ListView.builder(
            itemCount: _postsJson2.length,
            itemBuilder: (BuildContext context, int index) {
              final post = _postsJson2[index];
              return Row(children: [
                Text("${post["adversaire"]!["firstName"]} ${post["player"]!["score"]}"),
                RaisedButton(
                    child: Text("Voir les réponses "),

                    onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResultStudent(resultat: post)),
                    );}),
              ]);
            },
          ),
        ));
  }
}
