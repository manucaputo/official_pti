import 'package:flutter/material.dart';
import 'package:official_pti/second_button.dart';
import 'first_button.dart';
import 'second_button.dart';
import 'third_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'MixMath'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  /*
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  */

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
                'Lancer un duel',
              ),
              onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstButton(idQuestion: 0)),
                    );


              },
            ),
            RaisedButton(
              child: const Text(
                'Mes duels',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondButton()),
                );
              },
            ),
            RaisedButton(
              child: const Text(
                'Mes résultats',
              ),
              onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdButton()),
              );},
            ),
            RaisedButton(
              child: const Text(
                'Changer de classe',
              ),
              onPressed: () {},
            ),
            RaisedButton(
              child: const Text(
                'Contexte',
              ),
              onPressed: () {},
            ),
          ],
        )
      ]),
    );
  }
}
