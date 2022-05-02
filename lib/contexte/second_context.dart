import 'package:flutter/material.dart';

void main() => runApp(SecondContexte());

class SecondContexte extends StatefulWidget {
  @override
  State<SecondContexte> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class

}

class _MyAppState extends State<SecondContexte>{

  _MyAppState();

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      title: const Text('Contexte 2'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          const Center(child: Text("Application du théorème de Pythagore",
              style: TextStyle(
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic)),),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('A quoi sert le théorème de Pythagore ?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ))),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Le théorème de Pythagore est une formule de géométrie facile à comprendre et très utile dans la vie courante.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Voici comment l’appliquer de manière simple dans diverses situations.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Le théorème de Pythagore, c’est quoi ?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ))),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Le théorème de Pythagore s’applique aux triangles rectangles. Son principe : dans un triangle rectangle, le carré de la longueur de l’hypoténuse (le plus grand côté) est égal à la somme des carrés des longueurs des deux autres côtés. Pythagore, mathématicien grec de l’Antiquité, n’a pas inventé cette formule, qui était déjà utilisée par les Egyptiens. Mais, il l’a formalisée.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),


          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Exercice d’application',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ))),

          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Image.asset('/images/Contexte2-OK.png',
                scale: 3),
          ),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Est-ce qu’une sculpture rectangulaire de 42 m de haut sur 16 m de large peut être levée sous le plafond du Grand Palais qui mesure 45 m ? Pour cela, il faut connaître la longueur de la diagonale de la sculpture. En utilisant le théorème de Pythagore, le calcul est le suivant :',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('422 + 162 = 42 x 42 + 16 x 16 = 2020.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('√2020 ≈ 44,94 m',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('La sculpture passe de justesse sous la plafond du Grand Palais. ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),


        ],
      ),



    );



  }



}