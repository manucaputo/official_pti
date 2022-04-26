import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

// If you keep pushing on "ctrl" and click on some attribute, you can see the code source

class Question extends StatelessWidget {
  final String
      questionText; // "final" means that the initial value will never change after passing in the constr

  Question(
      this.questionText); // position argument (if we add {} --> name argument)

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10), //margin in all directions
        child: AutoSizeText(questionText,
            //maxLines: 1,
            style: TextStyle(
              //style du texte
              fontSize: 28,
              //fontWeight: FontWeight.bold,
            ),
          textAlign: TextAlign.center,)

    );
  }
}
