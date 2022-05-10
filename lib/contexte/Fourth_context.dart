import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(FourthContexte());

class FourthContexte extends StatefulWidget {
  @override
  State<FourthContexte> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class

}

class _MyAppState extends State<FourthContexte> {
  _MyAppState();
  bool isReadMore = false;
  bool isReadMore2 = false;
  bool isReadMore3 = false;
  bool isReadMore4 = false;
  bool isReadMore5 = false;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Résoudre un problème'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    // ETAPE 1
    Widget buildbutton() => ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            textStyle: const TextStyle(fontSize: 20),
            primary: const Color.fromRGBO(221, 229, 221, 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(
                  width: 5.0,
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                )),
          ),
          child: Text((isReadMore ? 'Cacher la réponse' : 'Voir la réponse'),
              style: const TextStyle(
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontStyle: FontStyle.italic)),
          onPressed: () {
            setState(() {
              // toggle the bool variable true or false
              isReadMore = !isReadMore;
            });
          },
        );

    Widget buildText(String text) {
      final lines = isReadMore ? null : 1;
      return Text(text,
          maxLines: lines,
          overflow: isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ));
    }

    ;

    // ETAPE 2

    Widget buildbutton2() => ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            textStyle: const TextStyle(fontSize: 20),
            primary: const Color.fromRGBO(221, 229, 221, 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(
                  width: 5.0,
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                )),
          ),
          child: Text((isReadMore2 ? 'Cacher la réponse' : 'Voir la réponse'),
              style: const TextStyle(
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontStyle: FontStyle.italic)),
          onPressed: () {
            setState(() {
              // toggle the bool variable true or false
              isReadMore2 = !isReadMore2;
            });
          },
        );

    Widget buildText2(String text) {
      final lines = isReadMore2 ? null : 1;
      return Text(text,
          maxLines: lines,
          overflow: isReadMore2 ? TextOverflow.visible : TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ));
    }

    ;

    // ETAPE 3

    Widget buildbutton3() => ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            textStyle: const TextStyle(fontSize: 20),
            primary: const Color.fromRGBO(221, 229, 221, 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(
                  width: 5.0,
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                )),
          ),
          child: Text((isReadMore3 ? 'Cacher la réponse' : 'Voir la réponse'),
              style: const TextStyle(
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontStyle: FontStyle.italic)),
          onPressed: () {
            setState(() {
              // toggle the bool variable true or false
              isReadMore3 = !isReadMore3;
            });
          },
        );

    Widget buildText3(String text) {
      final lines = isReadMore3 ? null : 1;
      return Text(text,
          maxLines: lines,
          overflow: isReadMore3 ? TextOverflow.visible : TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ));
    }

    ;
    // ETAPE 4

    Widget buildbutton4() => ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            textStyle: const TextStyle(fontSize: 20),
            primary: const Color.fromRGBO(221, 229, 221, 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(
                  width: 5.0,
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                )),
          ),
          child: Text((isReadMore4 ? 'Cacher la réponse' : 'Voir la réponse'),
              style: const TextStyle(
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontStyle: FontStyle.italic)),
          onPressed: () {
            setState(() {
              // toggle the bool variable true or false
              isReadMore4 = !isReadMore4;
            });
          },
        );

    Widget buildText4(String text) {
      final lines = isReadMore4 ? null : 1;
      return Text(text,
          maxLines: lines,
          overflow: isReadMore4 ? TextOverflow.visible : TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ));
    }

    ;

    // ETAPE 5

    Widget buildbutton5() => ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            textStyle: const TextStyle(fontSize: 20),
            primary: const Color.fromRGBO(221, 229, 221, 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(
                  width: 5.0,
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                )),
          ),
          child: Text((isReadMore5 ? 'Cacher la réponse' : 'Voir la réponse'),
              style: const TextStyle(
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontStyle: FontStyle.italic)),
          onPressed: () {
            setState(() {
              // toggle the bool variable true or false
              isReadMore5 = !isReadMore5;
            });
          },
        );

    Widget buildText5(String text) {
      final lines = isReadMore5 ? null : 1;
      return Text(text,
          maxLines: lines,
          overflow: isReadMore5 ? TextOverflow.visible : TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ));
    }

    ;

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 5.0),
            TextLiquidFill(
              text: 'Problème à caractère algébrique',
              textAlign: TextAlign.center,
              waveColor: const Color.fromRGBO(13, 78, 5, 0.6),
              boxBackgroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 85,
              boxWidth: 1000,
              loadDuration: const Duration(seconds: 2),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                child: const Text(
                    'Tu postules à un emploi d’été dans un bar. Il te faut vraiment la place pour pouvoir t’offrir ce dont tu rêves, tes premières vacances avec tes amis. Mais voilà : tu n’es pas le seul dans ton cas...25 jeunes comme postulent. Alors le patron propose un test de sélection : seuls seront retenus les 5 candidats qui résoudront ce problème, sans calculatrice. \n Table n°1 : 3 sodas et 4 cafés. L\'addition vaut 12 €. \n Table n°2 : 5 sodas et 4 cafés. L\'addition vaut 16€. \n Table n°3 : 2 sodas et 1 café. Quel est le montant de l’addition ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ))),
            Container(
                margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                child: const Text('Etape 1: Choix de l\'inconnue.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ))),
            Container(alignment: Alignment.center, child: buildbutton()),
            buildText(
                '\n Pour réussir, il faut trouver le prix d’un soda et le prix d’un café. Tu as donc deux inconnues à trouver : \n Soit x le prix du soda \n Soit y le prix du café \n  '),
            Container(
                margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                child: const Text('Etape 2 : Mise en équation.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ))),
            Container(alignment: Alignment.center, child: buildbutton2()),
            buildText2(
                '\n Nous obtenons un système de deux équations à deux inconnues \n 3x + 4y = 12 (équation 1) \n 2x + 4y = 16 (équation 2)'),
            Container(
                margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                child: const Text('Etape 3 : Résolution de l\'équation',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ))),
            Container(alignment: Alignment.center, child: buildbutton3()),
            buildText3(
                '\n De l\'équation 1, nous en tirons : \n 4y = 12 - 3x \n Nous insérons ce que nous obtenons dans l\'équation 2 : \n 5x + 12 -3x = 16 \n 2x + 12 = 16 \n 2x = 4 \n x = 2 \n Pour trouver y, nous pouvons l\'insérer dans une des deux équations de départ ( ici dans l\'équation 1) : \n 3.2 + 4y =12 \n 6 +4y = 12 \n 4y = 12 \n y = 3/2'),
            Container(
                margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                child: const Text('Etape 4 : Conclusion.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ))),
            Container(alignment: Alignment.center, child: buildbutton4()),
            buildText4(
                '\n Le tarif pour un soda est de 2€ et le tarif pour un café est de 1,5€. \n Nous pouvons ainsi résoudre le problème de la table 3 : \n 2x +1y =? \n 2.2 + 3/2 = 5,5€'),
            Container(
                margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                child: const Text('Etape 5 : Vérification',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ))),
            Container(alignment: Alignment.center, child: buildbutton5()),
            buildText5(
                '\n Nous pouvons utiliser l\'équation 2 pour vérifier la réponse de y et voir si elle concorde bien avec celle obtenue à l\'équation 1 \n 5.2 +4y =16 \n 10 + 4y = 16 \n 4y = 6 \n y = 3/2 \n Nous obtenons bien une réponse identique pour y, le problème est donc bien résolu. '),
          ],
        ),
      ),
    );
  }
}
