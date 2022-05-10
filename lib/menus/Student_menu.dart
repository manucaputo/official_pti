import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:official_pti/main.dart';
import '../buttons/first_button.dart';
import '../buttons/second_button.dart';
import '../contexte/contexte.dart';
import '../helpers/custom_routes.dart';
import '../buttons/third_button.dart';
import '../classes/join_class.dart';

// from scratch
void main() => runApp(StudentMenu()); // for functions who had only one argument

class StudentMenu extends StatefulWidget {
  @override
  State<StudentMenu> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<StudentMenu> {
  final url = "http://192.168.1.100:3000/api/result/my";
  var _postsJson = [];
  var token;

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: appBar,
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Image.asset('assets/images/Accueil_TITRE.png',
                          scale: 5),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 0),
                      child: ElevatedButton(
                        child: const Text('Lancer un duel',
                            style: TextStyle(
                                color: Color.fromRGBO(13, 78, 5, 0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
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
                          Navigator.of(context).pushReplacement(CustomRoute(
                            builder: (ctx) =>
                                FirstButton(idQuestion: 0, idDuel: 0),
                          ));
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                      child: ElevatedButton(
                        child: const Text('Répondre aux duels',
                            style: TextStyle(
                                color: Color.fromRGBO(13, 78, 5, 0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
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
                            CustomRoute(builder: (context) => SecondButton()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                      child: ElevatedButton(
                        child: const Text('Mes résultats',
                            style: TextStyle(
                                color: Color.fromRGBO(13, 78, 5, 0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
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
                            CustomRoute(builder: (context) => ThirdButton()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                      child: ElevatedButton(
                        child: const Text('Changer de classe',
                            style: TextStyle(
                                color: Color.fromRGBO(13, 78, 5, 0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
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
                            CustomRoute(builder: (context) => JoinClass()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 0),
                      child: ElevatedButton(
                        child: const Text('Contexte',
                            style: TextStyle(
                                color: Color.fromRGBO(13, 78, 5, 0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
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
                            CustomRoute(builder: (context) => Contexte()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 0),
                      child: ElevatedButton(
                        child: const Text('Déconnexion',
                            style: TextStyle(
                                color: Color.fromRGBO(13, 78, 5, 0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
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
                            CustomRoute(builder: (context) => const MyApp()),
                          );
                        },
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}

/* body: SingleChildScrollView(
          padding: EdgeInsets.all(5.0),

            child: Column(

              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: <Widget>[
                    Container(
                    height: 350,
                        alignment: Alignment.center,
                    child: Image.asset('assets/images/Accueil_TITRE.png',)),
                  const SizedBox(
                    height: 5.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(15.0, 0 , 15.0, 0),
                      child: ElevatedButton(
                        child: const Text(
                          'Lancer un duel',
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 65),
                          maximumSize: const Size(200, 65),
                          primary: const Color.fromRGBO(13, 78, 5, 0.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(CustomRoute(
                            builder: (ctx) =>
                                FirstButton(idQuestion: 0, idDuel: 0),
                          ));
                        },
                      ),
                    ),
                  const SizedBox(
                    height: 5.0,
                  ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                      child: ElevatedButton(
                        child: const Text(
                          'Mes duels',
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 65),
                          maximumSize: const Size(200, 65),
                          primary: const Color.fromRGBO(13, 78, 5, 0.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondButton()),
                          );
                        },
                      ),
                    ),
                  const SizedBox(
                    height: 5.0,
                  ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                      child: ElevatedButton(
                        child: const Text(
                          'Mes résultats',
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 65),
                          maximumSize: const Size(200, 65),
                          primary: const Color.fromRGBO(13, 78, 5, 0.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThirdButton()),
                          );
                        },
                      ),
                    ),
                  const SizedBox(
                    height: 5.0,
                  ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                      child: ElevatedButton(
                        child: const Text(
                          'Changer de classe',
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 65),
                          maximumSize: const Size(200, 65),
                          primary: const Color.fromRGBO(13, 78, 5, 0.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => JoinClass()),
                          );
                        },
                      ),
                    ),
                  const SizedBox(
                    height: 5.0,
                  ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 0),
                      child: ElevatedButton(
                        child: const Text(
                          'Contexte',
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 65),
                          maximumSize: const Size(200, 65),
                          primary: const Color.fromRGBO(13, 78, 5, 0.6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

            ));


  }
  */

/*
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(15.0, 0 , 15.0, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Lancer un duel',
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 65),
                      maximumSize: const Size(200, 65),
                      primary: const Color.fromRGBO(13, 78, 5, 0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(CustomRoute(
                        builder: (ctx) =>
                            FirstButton(idQuestion: 0, idDuel: 0),
                      ));
                    },
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: ElevatedButton(
                    child: const Text(
                      'Mes duels',
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 65),
                      maximumSize: const Size(200, 65),
                      primary: const Color.fromRGBO(13, 78, 5, 0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondButton()),
                      );
                    },
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: ElevatedButton(
                    child: const Text(
                      'Mes résultats',
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 65),
                      maximumSize: const Size(200, 65),
                      primary: const Color.fromRGBO(13, 78, 5, 0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdButton()),
                      );
                    },
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: ElevatedButton(
                    child: const Text(
                      'Changer de classe',
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 65),
                      maximumSize: const Size(200, 65),
                      primary: const Color.fromRGBO(13, 78, 5, 0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JoinClass()),
                      );
                    },
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Contexte',
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 65),
                      maximumSize: const Size(200, 65),
                      primary: const Color.fromRGBO(13, 78, 5, 0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            )));
  }
}

         */
