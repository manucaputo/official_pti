import 'package:flutter/material.dart';
import 'package:official_pti/main.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;

    if (resultScore == 3) {
      resultText = 'Résultat : $resultScore';
    } else if (resultScore < 3) {
      resultText = 'Résultat : $resultScore';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      //else
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          RaisedButton(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Back to Menu !',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            textColor: Colors.blue,
            //onPressed: resetHandler,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
          )
        ],
      ),
    );
  }
}
