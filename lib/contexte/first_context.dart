import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(FirstContexte());

class FirstContexte extends StatefulWidget {
  @override
  State<FirstContexte> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class

}

class _MyAppState extends State<FirstContexte>{

  _MyAppState();
  bool isReadMore = false;
  bool isReadMore2 = false;
  bool isReadMore3 = false;
  bool isReadMore4 = false;
  bool isReadMore5 = false;

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      title: const Text('Contexte 1'),
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

      child: Text((isReadMore?'Cacher la réponse':'Montrer la réponse'),
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
      } ,
    );

    Widget buildText(String text){
      final lines = isReadMore ? null : 1;
      return Text(
          text,
          maxLines: lines,
          overflow: isReadMore ? TextOverflow.visible: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          )
      );
    };

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
      child: Text((isReadMore2?'Cacher la réponse':'Montrer la réponse'),
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
      } ,
    );

    Widget buildText2(String text){
      final lines = isReadMore2 ? null : 1;
      return Text(
          text,
          maxLines: lines,
          overflow: isReadMore2 ? TextOverflow.visible: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 23,

          )
      );
    };

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
      child: Text((isReadMore3?'Cacher la réponse':'Montrer la réponse'),
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
      } ,
    );

    Widget buildText3(String text){
      final lines = isReadMore3 ? null : 1;
      return Text(
          text,
          maxLines: lines,
          overflow: isReadMore3 ? TextOverflow.visible: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 23,

          )
      );
    };
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
      child: Text((isReadMore4?'Cacher la réponse':'Montrer la réponse'),
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
      } ,
    );

    Widget buildText4(String text){
      final lines = isReadMore4 ? null : 1;
      return Text(
          text,
          maxLines: lines,
          overflow: isReadMore4 ? TextOverflow.visible: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 23,

          )
      );
    };

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
      child: Text((isReadMore5?'Cacher la réponse':'Montrer la réponse'),
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
      } ,
    );

    Widget buildText5(String text){
      final lines = isReadMore5 ? null : 1;
      return Text(
          text,
          maxLines: lines,
          overflow: isReadMore5 ? TextOverflow.visible: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 23,

          )
      );
    };


    return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,

        body: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),

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

              Container(alignment: Alignment.center, child: buildbutton()),

              buildText('\n Soit x le tarif pour un adulte.'),
              /*

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Soit x le tarif pour un adulte.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ), */

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Etape 2 : Mise en équation.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(alignment: Alignment.center, child: buildbutton2()),
              buildText2('\n Le prix pour un enfant est x-7 \n Il y a trois adultes et 30 enfants , on doit donc résoudre l\'équation: \n 3x+30(x-7)=615.'),
             /*
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
              ), */

              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Etape 3 : Résolution de l\'équation',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(alignment: Alignment.center, child: buildbutton3()),
              buildText3('\n 3x+30x-210=615 \n soit 33x=615+210 \n soit encore x=825/33 \n ce qui donne x=25 '),

              /*

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
 */
              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Etape 4 : Conclusion.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(alignment: Alignment.center, child: buildbutton4()),
              buildText4('\n Le tarif pour un adulte est de 25 €.'),

              /*
              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Le tarif pour un adulte est de 25 €.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),
*/
              Container(
                  margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
                  child: const Text('Etape 5 : Vérification',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ))
              ),

              Container(alignment: Alignment.center, child: buildbutton5()),
              buildText5('\n Tarif adulte 25€ ; tarif enfant 25-7=18€ \n Prix payé par le groupe 3x25+30x18 = 615€'),
           /*

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
              ),*/


            ],
          ),
        ),



        );


  }



}