import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:official_pti/lists/list_duel.dart';
import 'dart:convert';
import '../buttons/first_button.dart';
import 'list_duel.dart';
import '../connexion/token.dart';
// from scratch

void main() {
  var idClass;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListStudent(idClass: idClass),
  ));
}

class ListStudent extends StatefulWidget {
  var idClass;
  ListStudent({
    required this.idClass,
  });
  @override
  State<ListStudent> createState() => _MyAppState(
      idClass); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<ListStudent> {
  var idClass;
  final url = "/users/allClass/";

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
      final response = await http.get(
          Uri.parse(Token.url + url + idClass.toString()),
          headers: headers);
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

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Mes élèves'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: _postsJson2.length,
            itemBuilder: (BuildContext context, int index) {
              final post = _postsJson2[index];
              var index_2 = index + 1;

              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  title: Text(("${post["firstName"]} " + "${post["name"]}")),
                  trailing: Wrap(
                    spacing: 0, // space between two icons
                    children: <Widget>[
                      IconButton(
                          icon: const Icon(
                            Icons.delete,
                            size: 32,
                          ),
                          color: Theme.of(context).errorColor,
                          onPressed: () {} // icon-2
                          ),
                      ElevatedButton(
                        child: const Text('Résultats',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontStyle: FontStyle.italic)),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 55),
                          maximumSize: const Size(100, 55),
                          primary: const Color.fromRGBO(255, 255, 255, 1.0),
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
                                builder: (context) => ListDuel(
                                      idUser: post["id"],
                                      firstName: post["firstName"],
                                    )),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }));
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
*/
