import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Menu'),
      backgroundColor: Color.fromRGBO(0, 0, 255, 0.6),
    );
    return Scaffold(
        appBar: appBar,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/Accueil_TITRE.png",
                ),
                fit: BoxFit.fitWidth,
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(0, 0, 255, 0.5),
                  Colors.greenAccent,
                ],
              )),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: const Text(
                    'Lancer un duel',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Pour arrondir les angles du bouton
                  ),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: const Text(
                    'Mes duels',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Pour arrondir les angles du bouton
                  ),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: const Text(
                    'Mes résultats résultats',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Pour arrondir les angles du bouton
                  ),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: const Text(
                    'Changer de classe',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Pour arrondir les angles du bouton
                  ),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: const Text(
                    'Contexte',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Pour arrondir les angles du bouton
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
