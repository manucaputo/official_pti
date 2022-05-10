import 'package:flutter/material.dart';

void main() => runApp(ThirdContexte());

class ThirdContexte extends StatefulWidget {
  @override
  State<ThirdContexte> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class

}

class _MyAppState extends State<ThirdContexte> {
  _MyAppState();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Contexte 3'),
      backgroundColor: const Color.fromRGBO(13, 78, 5, 0.75),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Center(
            child: Text("Application du théorème de Thalès",
                style: TextStyle(
                    color: Color.fromRGBO(13, 78, 5, 0.6),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.italic)),
          ),

          /*
          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Le théorème de Thalès, c’est quoi ?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ))),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Thalès est un savant, astronome, physicien, politicien et géomètre grec qui a vécu au VIIème siècle avant notre ère. Il est l’inventeur du théorème qui porte son nom. Le principe : dans un triangle, on peut identifier un autre triangle, plus petit celui-là. Sur l’image ci-dessous, si le côté violet a pour longueur le triple du côté rouge, alors il en sera de même pour le côté bleu par rapport au côté noir. Mais aussi pour le côté vert par rapport au côté jaune',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Cela donne : AI / AB = AJ / AC = IJ / BC.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),

          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Image.asset('/images/Thales1.png',
                scale: 3.5),
          ),

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Le théorème de Thalès sert donc à calculer les longueurs dans une figure géométrique composée de triangles.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))), */

          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Comment appliquer le théorème de Thalès ?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ))),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Image.asset('/images/thales2.png', scale: 2.3),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text(
                  'Dans le village où Morgane vient d’être élue maire, on a posé un grand sapin sur la place de la mairie. Mais l’arbre peut-il endommager la mairie en cas de chute ? Pour le savoir, Morgane utilise le théorème de Thalès pour déduire la hauteur du sapin qui est face à elle. Pour cela, elle utilise les rayons du soleil pour former les deux triangles nécessaires à l’application du théorème. Ainsi :',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),
          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text(
                  'Elle calcule la longueur de l’ombre du sapin : il fait 10 mètres.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),
          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text(
                  'Elle dépose son foulard à 10 mètres de l’arbre, à la pointe de l’ombre.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),
          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text(
                  'Elle se place à un mètre du foulard à l’intérieur de l’ombre, soit à 9 mètres du sapin.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),
          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text('Elle note qu’elle mesure 1 m 70',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),
          Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 2.0),
              child: const Text(
                  'Morgane sait que la distance qui sépare le tronc de l’arbre du foulard est 10 fois plus grande que la distance qui la sépare du foulard. Morgane déduit que la taille de l’arbre est 10 fois plus grande que la sienne. Donc : 1,70 m x 10 = 17 m. Sachant que l’arbre se situe à 18 mètres de la mairie, s’il venait à tomber, le sapin s\'écraserait à 1 mètre de la mairie. Grâce à Thalès, Morgane n’a donc pas besoin d\'abattre l\'arbre.',
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
