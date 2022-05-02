import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'list_student.dart';
import '../connexion/token.dart';

// from scratch

void main() => runApp(ListClass()); // for functions who had only one argument

class ListClass extends StatefulWidget {
  @override
  State<ListClass> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<ListClass> {
  final url = "/class/all";
  final urlDelete = "/class/delete/";
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

  var items = [
    'Equation',
    'Intégrale',
    'Dérivée',
  ];

  var dropdownValue = [
    'Equation',
    'Intégrale',
    'Dérivée',
    'Equation',
    'Intégrale',
    'Dérivée',
    'Equation',
    'Intégrale',
    'Dérivée',
    'Equation',
    'Intégrale',
    'Dérivée',
  ];

  getClass() async {
    try {
      final response =
          await http.get(Uri.parse(Token.url + url), headers: headers);
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }

  deleteClassBackend(var id) async {
    try {
      final response =
          await http.delete(Uri.parse(Token.url + urlDelete + id.toString()));
    } catch (err) {
      print(err);
    }
  }

  void deleteClass(var id) {
    setState(() {
      _postsJson2.removeWhere((element) => element["id"] == id);
      //_postsJson.removeWhere((element) => element["idDuel"] == idDuel);
    });
  }

  @override
  void initState() {
    super.initState();
    getClass();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Mes classes'),
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
                  title: Text(("${post["name"]}")),
                  trailing: Wrap(
                    spacing: 0, // space between two icons
                    children: <Widget>[
                      DropdownButton(
                        value: dropdownValue[index],
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: items.map((items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue[index] = value!;
                          });
                        },
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.delete,
                            size: 32,
                          ),
                          color: Theme.of(context).errorColor,
                          onPressed: () {
                            deleteClass(post["id"]);
                            //deleteClassBackend(post["id"]);
                          } // icon-2
                          ),
                      IconButton(
                          icon: const Icon(
                            Icons.person_search_rounded,
                            size: 32,
                          ),
                          color:
                              const Color.fromRGBO(0, 0, 0, 0.7490196078431373),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ListStudent(idClass: post["id"])),
                            );
                          }),
                    ],
                  ),
                ),
              );
            }));
  } // It already exists but we override with our own method --> To make the code more clear
}
