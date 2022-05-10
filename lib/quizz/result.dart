//import 'dart:html';
//import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:official_pti/menus/Student_menu.dart';
import 'package:official_pti/main.dart';
import '../../helpers/custom_routes.dart';
import '../main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../connexion/token.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  var response;
  var idDuel;
  String url = "/player/create";

  Result(this.resultScore, this.resetHandler, this.response, this.idDuel);

  String get resultPhrase {
    var resultText;

    resultText = 'Score : $resultScore' '/5';
    return resultText;
  }

  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };
  @override
  postPlayer() async {
    try {
      Map<String, String> json = {
        "score": resultScore.toString(),
        "Q1": response[0].toString(),
        "Q2": response[1].toString(),
        "Q3": response[2].toString(),
        "Q4": response[3].toString(),
        "Q5": response[4].toString(),
        "duelId": idDuel.toString()
      };
      String json2 = jsonEncode(json);
      print(json2);

      final response2 = await http.post(Uri.parse(Token.url + url),
          body: json2, headers: headers);
      final jsonData = jsonDecode(response.body);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: CircleAvatar(
                backgroundColor: const Color.fromRGBO(221, 229, 221, 1.0),
                radius: 80,
                child: Image.asset('assets/images/logo.png', scale: 6)),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15.0, 10, 15, 10),
            child: ElevatedButton(
                child: const Text('Menu',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        fontStyle: FontStyle.italic)),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(800, 65),
                  maximumSize: const Size(800, 65),
                  primary: const Color.fromRGBO(13, 78, 5, 0.6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(
                        width: 5.0,
                        color: Color.fromRGBO(221, 229, 221, 1.0),
                      )),
                ),
                onPressed: () {
                  resetHandler;
                  postPlayer();
                  //Navigator.push(
                  // context,
                  //MaterialPageRoute(builder: (context) => StudentMenu()),
                  // );
                  Navigator.of(context).pushReplacement(CustomRoute(
                    builder: (ctx) => StudentMenu(),
                  ));
                }),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              'Score : ' '$resultScore' '/5',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text(
                'Réponses sélectionnées',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                  fontSize: 22,
                ),
              )),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: response.length,
              itemBuilder: (BuildContext context, int index) {
                var index_2 = index + 1;

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: ListTile(
                    tileColor: const Color.fromRGBO(221, 229, 221, 1.0),
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text(
                            'Q ' '$index_2',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      response[index],
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18),
                    ),
                    //subtitle: Text(''),
                  ),
                );
              }),
        ])),
      ),
    );
  }
}
