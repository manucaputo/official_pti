import 'package:flutter/material.dart';
import '../buttons/first_button.dart';
import '../buttons/second_button.dart';
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
            Color.fromRGBO(241, 240, 239, 1.0),
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
            /*
        ElevatedButton(

        style: ElevatedButton.styleFrom(
        onPrimary: Colors.black87,
          primary: Colors.grey[300],
          minimumSize: Size(88, 36),
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: ElevatedButton.styleFrom(
            primary: ThemeColors.darkBg,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.black)),
          ),
          onPressed: () { },
          child: Text('Looks like a RaisedButton'),
        ),

*/

            Flexible(
              child: Container(
                margin: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 2.0),
                height: 75,
                child: ElevatedButton(
                  child: const Text(
                    'Lancer un duel',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    //onPrimary: Colors.black87,
                    primary: const Color.fromRGBO(13, 78, 5, 0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    /*

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstButton(idQuestion: 0,idDuel: 0,)),
                    );

                     */

                    Navigator.of(context).pushReplacement(CustomRoute(
                      builder: (ctx) => FirstButton(idQuestion: 0, idDuel: 0),
                    ));
                  },
                ),
              ),
            ),
            ElevatedButton(
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
            ElevatedButton(
              child: const Text(
                'Mes résultats',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdButton()),
                );
              },
            ),
            ElevatedButton(
              child: const Text(
                'Changer de classe',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JoinClass()),
                );
              },
            ),
            ElevatedButton(
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
