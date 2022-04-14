import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:official_pti/resultat.dart';
import 'dart:convert';
import 'result.dart';
import 'list_class.dart';

// from scratch

void main() => runApp(ProfMenu()); // for functions who had only one argument

class ProfMenu extends StatefulWidget {
  @override
  State<ProfMenu> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<ProfMenu> {
  final url = "http://192.168.1.100:3000/api/result/my";
  var _postsJson = [];

  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization":
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjQsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NDk3ODM2NDMsImV4cCI6MTY4NTc4MzY0M30.68QnFxq2lKjGwa5hW16KBTmADSPJuGKRn_omnoTGn04"
  };

  var items = [
    'Equation',
    'Intégrale',
    'Dérivée',

  ];

  var dropdownValue = 'Equation';



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Menu'),
      backgroundColor: const Color.fromRGBO(0, 0, 255, 0.55),
    );

    return Scaffold(
      appBar: appBar,
      body: Stack(children: <Widget>[
        Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(241, 240, 239, 1.0),
                    Color.fromRGBO(175, 175, 164, 0.9),
                  ],
                ))),
        Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.width * 0,
            child: Container(
              //margin: EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/images/Accueil_TITRE.png', scale: 1.5),
                  ]),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
              child: const Text(
                'Mes classes',
              ),
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListClass()),
              );},
            ),
            RaisedButton(
              child: const Text(
                'Créer une classe',
              ),
              onPressed: () {

              },
            ),
            DropdownButton(
              value: dropdownValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(), onChanged: (String? value) { setState(() {
              dropdownValue = value!;
            }); },

            ),
          ],
        )
      ]),
    );
  }
}
