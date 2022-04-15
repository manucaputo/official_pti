import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:official_pti/second_button.dart';
import 'first_button.dart';
import 'second_button.dart';
import 'third_button.dart';
import 'prof_menu.dart';
import 'main.dart';
import 'token.dart';

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
    print("c'est bon");
    print(Token.token);



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
                'Lancer un duel',
              ),
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstButton(idQuestion: 0,idDuel: 0,)),
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
