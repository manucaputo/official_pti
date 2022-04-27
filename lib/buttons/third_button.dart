import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:official_pti/Resultats/resultat.dart';
import 'package:official_pti/connexion/token.dart';
import 'dart:convert';
import '../quizz/result.dart';

// from scratch

void main() => runApp(ThirdButton()); // for functions who had only one argument
class ThirdButton extends StatefulWidget {




  @override
  State<ThirdButton> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class


}



class _MyAppState extends State<ThirdButton> {
  final url = "/result/my";
  var _postsJson = [];
  var test="coucou";



  _MyAppState();





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
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization":
    Token.token
  };

  getReply() async {
    try {
      final response = await http.get(Uri.parse(Token.url+url), headers: headers);
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
  var a=2;

  @override // It already exists but we override with our own method --> To make the code more clear
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('MixMath'),
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
                              ResultatButton(resultat: post)),
                    );}),
              ]);
            },
          ),
        ));
  }
}