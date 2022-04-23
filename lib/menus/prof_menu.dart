import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:official_pti/classes/create_class.dart';
import 'package:official_pti/Resultats/resultat.dart';
import 'dart:convert';
import '../quizz/result.dart';
import '../lists/list_class.dart';
import '../classes/create_class.dart';

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
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,

        body: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Image.asset('assets/images/Accueil_TITRE.png',
                      scale: 2),

                  Container(

                    margin: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 0),
                    child: ElevatedButton(
                      child: const Text('Mes classes',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 78, 5, 0.6),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontStyle: FontStyle.italic)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(800, 65),
                        maximumSize: const Size(800, 65),
                        primary: const Color.fromRGBO(221, 229, 221, 1.0),
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
                          MaterialPageRoute(builder: (context) => ListClass()),
                        );

                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                    child: ElevatedButton(
                      child: const Text('Créer une classe',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 78, 5, 0.6),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontStyle: FontStyle.italic)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(800, 65),
                        maximumSize: const Size(800, 65),
                        primary: const Color.fromRGBO(221, 229, 221, 1.0),
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
                              builder: (context) =>
                                  CreateClass()),
                        );

                      },
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 0),
                    child: ElevatedButton(
                      child: const Text('Déconnexion',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 78, 5, 0.6),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontStyle: FontStyle.italic)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(800, 65),
                        maximumSize: const Size(800, 65),
                        primary: const Color.fromRGBO(221, 229, 221, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                              width: 5.0,
                              color: Color.fromRGBO(13, 78, 5, 0.6),
                            )),
                      ),
                      onPressed: () {

                      },
                    ),
                  ),
                ]),
          ),
        ));
      /*
            DropdownButton(
              value: dropdownValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(), onChanged: (String? value) { setState(() {
              dropdownValue = value!;
            }); },
            ),
    */
  }
}
