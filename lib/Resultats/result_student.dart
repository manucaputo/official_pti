import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../buttons/first_button.dart';

void main() {
  var resultat;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ResultStudent(
      resultat: resultat,
    ),
  ));
}

class ResultStudent extends StatefulWidget {

  var resultat;
  ResultStudent({
    required this.resultat,
  });
  @override
  State<ResultStudent> createState() => _MyAppState(resultat); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<ResultStudent> {
  var resultat;
  _MyAppState(this.resultat);
  final url = "http://192.168.1.100:3000/api/result/my";
  var _postsJson = [];
  final _postsJson2 =
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
  };

  @override
  void initState() {
    super.initState();

    print(resultat);
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


              ]);
            },
          ),
        ));
  }
}
