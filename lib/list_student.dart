import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:official_pti/list_duel.dart';
import 'dart:convert';
import 'first_button.dart';
import 'list_duel.dart';
import 'token.dart';
// from scratch

void main() {
  var idClass;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListStudent(
        idClass : idClass
    ),
  ));
}


class ListStudent extends StatefulWidget {
  var idClass;
  ListStudent({
    required this.idClass,
  });
  @override
  State<ListStudent> createState() =>
      _MyAppState(idClass); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<ListStudent> {
  var idClass;
  final url = "http://192.168.1.100:3000/api/users/allClass/";

  var _postsJson = [];
  final _postsJson2 = [
    {
      "id": 1,
      "firstName": "Adrien",
      "name": "Dubois",
      "email": "181887@umons.ac.be",
      "isAdmin": false
    },
    {
      "id": 2,
      "firstName": "Adrien",
      "name": "Dubois",
      "email": "1818872@umons.ac.be",
      "isAdmin": false
    },
    {
      "id": 3,
      "firstName": "Adrien",
      "name": "Dubois",
      "email": "1818873@umons.ac.be",
      "isAdmin": true
    },
    {
      "id": 4,
      "firstName": "Seph",
      "name": "CSN",
      "email": "Seph@umons.ac.be",
      "isAdmin": false
    },
    {
      "id": 6,
      "firstName": "Mic",
      "name": "CSN",
      "email": "Mic@umons.ac.be",
      "isAdmin": false
    }
  ];

  _MyAppState(this.idClass);
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };

  getStudent() async {
    try {
      final response = await http.get(Uri.parse(url+idClass.toString()), headers: headers);
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;

      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    getStudent();

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
                Text("${post["firstName"]} " + "${post["name"]}"),
                RaisedButton(
                    child: Text("Voir les résultats"),
                    onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ListDuel(idUser: post["id"])),
                    );

                    }),
              ]);
            },
          ),
        ));
  }
}