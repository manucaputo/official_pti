import 'package:flutter/material.dart';

void main() => runApp(Contexte());

class Contexte extends StatefulWidget {
  @override
  State<Contexte> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class

}

class _MyAppState extends State<Contexte>{

  _MyAppState();

  @override
  Widget build(BuildContext context) {

    return Container(

        child:  Image.asset('assets/images/fond-OK.jpg'),
      );


    /*
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("Contexte en cours, je vérifie des trucs !"))
        ],
      ),
    ); */
  }

  
  
}