import 'package:flutter/material.dart';

// If you keep pushing on "ctrl" and click on some attribute, you can see the code source

class Question extends StatelessWidget {
  final String
      questionText; // "final" means that the initial value will never change after passing in the constr

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10), //margin in all directions
      child: Text(
        questionText,
        style: const TextStyle(
            fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
