import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../connexion/token.dart';



// from scratch

void main() =>
    runApp(SecondButton()); // for functions who had only one argument

class SecondButton extends StatefulWidget {
  @override
  State<SecondButton> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<SecondButton> {
  final url = "/reply/all";
  var _postsJson = [];

  final _postsJson2 = [
    {
      "firstName": "Mic2",
      "id": 4,
      "idDuel": 14,
      "idAdversaire": 6,
      "idQuestion": 1
    },
    {
      "firstName": "Mic",
      "id": 6,
      "idDuel": 16,
      "idAdversaire": 6,
      "idQuestion": 1
    },
    {
      "firstName": "Adrien",
      "id": 8,
      "idDuel": 18,
      "idAdversaire": 2,
      "idQuestion": 2
    },
    {
      "firstName": "Adrien",
      "id": 9,
      "idDuel": 19,
      "idAdversaire": 2,
      "idQuestion": 2
    },
    {
      "firstName": "Adrien",
      "id": 13,
      "idDuel": 23,
      "idAdversaire": 2,
      "idQuestion": 2
    },
    {
      "firstName": "Adrien",
      "id": 13,
      "idDuel": 23,
      "idAdversaire": 2,
      "idQuestion": 2
    },
    {
      "firstName": "Adrien",
      "id": 13,
      "idDuel": 23,
      "idAdversaire": 2,
      "idQuestion": 2
    },
    {
      "firstName": "Adrien",
      "id": 13,
      "idDuel": 23,
      "idAdversaire": 2,
      "idQuestion": 2
    },

  ];
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };

  getReply() async {
    try {
      final response = await http.get(
          Uri.parse(Token.url + url), headers: headers);
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }



  @override
  void initState() {
    super.initState();
    //getReply();
  }

  @override
  Widget build(BuildContext context) {


    final appBar = AppBar(
      title: const Text('Mes duels'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );


      return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,

          body: ListView.builder(
          itemCount: _postsJson2.length,
          itemBuilder: (BuildContext context, int index) {
            final post = _postsJson2[index];
            var index_2 = index+1;

            return Card(

              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: ListTile(
                tileColor: const Color.fromRGBO(221, 229, 221, 1.0),
              leading: CircleAvatar(
                backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: FittedBox(
                  child: Text(
                      "$index_2",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
                title: Text(
                    ("${post["firstName"]}")
                ),
                  subtitle: const Text(
                    'Date du jour'
            ),

                  trailing: Wrap(
                  spacing: 0, // space between two icons
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.delete, size: 32,),

                        color: Theme.of(context).errorColor,
                        onPressed: () {
                        }// icon-2
                    ),
                    IconButton(
                        icon: const Icon(Icons.check, size: 32,),
                        color: Colors.green,
                        onPressed: () {
                        }),
                   ],
                ),
                ),


              );


            }
      ));
  }
}

/*
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
            Text("${post["firstName"]}"),
            RaisedButton(
                child: Text(" ${post["idQuestion"]}"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FirstButton(idQuestion: post["idQuestion"],idDuel: post["idDuel"],)),
                  );
                }),
          ]);
        },
      ),
    ));
  }
}

*/