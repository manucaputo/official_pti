import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../connexion/token.dart';
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
  final url = "/reply/all";
  final urlDelete = "/reply/delete/";
  var _postsJson = [];

  final _postsJson2 = [
    {
      "firstName": "Seph",
      "id": 1,
      "idDuel": 11,
      "idAdversaire": 4,
      "idQuestion": 1,
      "date": "2022-04-04T15:12:28.000Z"
    },
    {
      "firstName": "Mic",
      "id": 2,
      "idDuel": 12,
      "idAdversaire": 6,
      "idQuestion": 1,
      "date": "2022-04-05T10:29:24.000Z"
    },
    {
      "firstName": "Mic",
      "id": 5,
      "idDuel": 15,
      "idAdversaire": 6,
      "idQuestion": 1,
      "date": "2022-04-05T10:30:20.000Z"
    },
    {
      "firstName": "Mic",
      "id": 7,
      "idDuel": 17,
      "idAdversaire": 6,
      "idQuestion": 1,
      "date": "2022-04-05T10:32:08.000Z"
    },
    {
      "firstName": "Seph",
      "id": 15,
      "idDuel": 25,
      "idAdversaire": 4,
      "idQuestion": 0,
      "date": "2022-04-12T13:45:55.000Z"
    },
    {
      "firstName": "Seph",
      "id": 20,
      "idDuel": 30,
      "idAdversaire": 4,
      "idQuestion": 0,
      "date": "2022-04-12T13:55:22.000Z"
    },
    {
      "firstName": "Seph",
      "id": 21,
      "idDuel": 31,
      "idAdversaire": 4,
      "idQuestion": 0,
      "date": "2022-04-12T13:56:14.000Z"
    },
    {
      "firstName": "Seph",
      "id": 23,
      "idDuel": 33,
      "idAdversaire": 4,
      "idQuestion": 3,
      "date": "2022-04-12T14:07:41.000Z"
    },
    {
      "firstName": "Seph",
      "id": 28,
      "idDuel": 38,
      "idAdversaire": 4,
      "idQuestion": 3,
      "date": "2022-04-12T14:10:45.000Z"
    },
    {
      "firstName": "Seph",
      "id": 29,
      "idDuel": 39,
      "idAdversaire": 4,
      "idQuestion": 3,
      "date": "2022-04-12T14:11:18.000Z"
    }
  ];
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization": Token.token
  };

  getReply() async {
    try {
      final response =
          await http.get(Uri.parse(Token.url + url), headers: headers);
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }

  deleteReply(var id) async
  {
    try{
      final response = await http.delete(Uri.parse(Token.url+urlDelete+id.toString()),headers: headers);
    }
    catch(err){print(err);}
  }

  void deleteDuel(var idDuel) {
    setState(() {
      _postsJson2.removeWhere((element) => element["idDuel"] == idDuel);
      //_postsJson.removeWhere((element) => element["idDuel"] == idDuel);
    });
  }

  @override
  void initState() {
    super.initState();
    getReply();
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
            itemCount: _postsJson.length,
            itemBuilder: (BuildContext context, int index) {
              final post = _postsJson[index];
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
                  title: Text(("${post["firstName"]}")),
                  subtitle: Text('Date : ' +
                      post["date"].toString().substring(8, 10) +
                      post["date"].toString().substring(4, 8) +
                      post["date"].toString().substring(0, 4)),
                  trailing: Wrap(
                    spacing: 0, // space between two icons
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          size: 32,
                        ),
                        color: Theme.of(context).errorColor,
                        onPressed: () =>{
                          deleteDuel(post["idDuel"]),
                          //deleteReply(post["id"])
                         },
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.check,
                            size: 32,
                          ),
                          color: Colors.green,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstButton(
                                        idQuestion: post["idQuestion"],
                                        idDuel: post["idDuel"],
                                      )),
                            );
                          }),
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
