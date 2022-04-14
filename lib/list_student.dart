import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:official_pti/list_duel.dart';
import 'dart:convert';
import 'first_button.dart';
import 'list_duel.dart';
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
      "name": "classe1",
      "password": "1234",
      "createdAt": "2022-03-20T21:46:44.000Z",
      "updatedAt": "2022-03-20T21:46:44.000Z"
    },
    {
      "id": 2,
      "name": "classe2",
      "password": "1234",
      "createdAt": "2022-04-06T09:49:12.000Z",
      "updatedAt": "2022-04-06T09:49:12.000Z"
    },
    {
      "id": 3,
      "name": "classe3",
      "password": "1234",
      "createdAt": "2022-04-06T10:53:32.000Z",
      "updatedAt": "2022-04-06T10:53:32.000Z"
    }
  ];

  _MyAppState(this.idClass);
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization":
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMsImlzQWRtaW4iOnRydWUsImlhdCI6MTY0OTk2NjU2MywiZXhwIjoxNjg1OTY2NTYzfQ.yMGgtgmHKDU83BUQP_TJYX4ONtzMohbJXTBiPeyJI98"
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
            itemCount: _postsJson.length,
            itemBuilder: (BuildContext context, int index) {
              final post = _postsJson[index];

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