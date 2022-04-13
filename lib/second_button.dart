import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'first_button.dart';

// from scratch

void main() =>
    runApp(SecondButton()); // for functions who had only one argument

class SecondButton extends StatefulWidget {
  @override
  State<SecondButton> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<SecondButton> {
  final url = "http://192.168.1.100:3000/api/reply/all";
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
    }
  ];
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NDk3NjY5NjMsImV4cCI6MTY4NTc2Njk2M30.P1mIica2XmcowNwLwiss0g6Mhf_eniSjxcN7wFnmTjs"
  };

  getReply() async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
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
