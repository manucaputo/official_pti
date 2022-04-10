import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.lightBlue, Colors.lightBlue]),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.greenAccent,
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text(
                    'Lancer une partie',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {},
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    child: Text(
                      'Mes duels',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {},
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    child: Text(
                      'Résultats',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {},
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    child: Text(
                      'Changer de classe',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {},
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    child: Text(
                      'Contexte',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {},
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
