import 'package:flutter/material.dart';
import 'package:official_pti/contexte/first_context.dart';
import 'package:official_pti/contexte/second_context.dart';
import 'package:official_pti/contexte/third_context.dart';

import '../helpers/custom_routes.dart';
import 'Fourth_context.dart';

void main() => runApp(Contexte());

class Contexte extends StatefulWidget {
  @override
  State<Contexte> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class

}

class _MyAppState extends State<Contexte> {
  _MyAppState();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Contexte'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    return Scaffold(
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

                  // CONTEXTE 1
                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 20, 15.0, 0),
                    child: ElevatedButton(
                      child: const Text('Contexte 1',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 78, 5, 0.6),
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
                          CustomRoute(builder: (context) => FirstContexte()),
                        );
                      },
                    ),
                  ),

                  // CONTEXTE 2
                  /*
                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                    child: ElevatedButton(
                      child: const Text('Contexte 2',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 78, 5, 0.6),
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
                          MaterialPageRoute(
                              builder: (context) => SecondContexte()),
                        );
                      },
                    ),
                  ),



                  // CONTEXTE 3
                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                    child: ElevatedButton(
                      child: const Text('Contexte 3',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 78, 5, 0.6),
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
                          MaterialPageRoute(
                              builder: (context) => ThirdContexte()),
                        );
                      },
                    ),
                  ),

                   */

                  // Contexte 4

                  Container(
                    margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                    child: ElevatedButton(
                      child: const Text('Contexte 2',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 78, 5, 0.6),
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
                          CustomRoute(builder: (context) => FourthContexte()),
                        );
                      },
                    ),
                  ),

                  //  NEW Contexte
                ]),
          ),
        ));
  }
}
