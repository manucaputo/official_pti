import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'list_student.dart';
import '../connexion/token.dart';

// from scratch

void main() =>
    runApp(ListClass()); // for functions who had only one argument

class ListClass extends StatefulWidget {
  @override
  State<ListClass> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<ListClass> {
  final url = "http://192.168.1.100:3000/api/class/all";
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
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };

  getClass() async {
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
    getClass();
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
                Text("${post["name"]}"),
                RaisedButton(
                    child: Text("Voir les élèves de la classe"),
                    onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ListStudent(idClass: post["id"])),
                    );

                    }),
              ]);
            },
          ),
        ));
  }
}