import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;

    if (resultScore == 3) {
      resultText = 'you the best';
    } else if (resultScore < 3) {
      resultText = 'you lost !';
    }

    return resultText;

  }

  @override
  Widget build(BuildContext context) {

    return Center(
      //else
      child: Column(


        children: [


          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),


          FlatButton(
            child: Text('restart quiz !'),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )


        ],


      ),

    );
  }
}
