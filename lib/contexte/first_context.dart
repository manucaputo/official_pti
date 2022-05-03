import 'package:flutter/material.dart';

void main() => runApp(FirstContexte());

class FirstContexte extends StatefulWidget {
  @override
  State<FirstContexte> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class

}

class _MyAppState extends State<FirstContexte>{

  _MyAppState();

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      title: const Text('Contexte 1'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );


    return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const Center(child: Text("Problème à caractère algébrique",
                        style: TextStyle(
                             color: Color.fromRGBO(13, 78, 5, 0.6),
                             fontWeight: FontWeight.bold,
                             fontSize: 30,
                             fontStyle: FontStyle.italic)),),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Un groupe scolaire constitué d\'un enseignant, de deux parents accompagnateurs, et de trente enfants se rendent au théâtre pour voir une représentation de L\'Avare de Molière. Les enfants bénéficient d\'un tarif réduit soit 7 euros de moins que le tarif adulte.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      ))),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Sachant qu\'au total le prix de la sortie théâtre est de 615 euros, à combien s\'élève le tarif pour un adulte ?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Etape 1: Choix de l\'inconnue.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Soit x le tarif pour un adulte.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Etape 2 : Mise en équation.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Le prix pour un enfant est x-7.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Il y a trois adultes et 30 enfants , on doit donc résoudre l\'équation: 3x+30(x-7)=615.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Etape 3 : Résolution de l\'équation',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('3x+30x-210=615',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('soit 33x=615+210',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('soit encore x=825/33',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('ce qui donne x=25',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Etape 4 : Conclusion.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Le tarif pour un adulte est de 25 €.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Etape 5 : Vérification',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Tarif adulte 25€ ; tarif enfant 25-7=18€',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Prix payé par le groupe 3x25+30x18 = 615€',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),


            ],
          ),
        ),



        );


  }



}