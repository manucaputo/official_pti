import 'package:flutter/material.dart';

// If you keep pushing on "ctrl" and click on some attribute, you can see the code source

class Question extends StatelessWidget {
  final String
      questionText; // "final" means that the initial value will never change after passing in the constr

  Question(
      this.questionText); // position argument (if we add {} --> name argument)

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10), //margin in all directions
        child: Text(
          questionText,
          //maxLines: 1,
          style:  TextStyle(fontSize: screenWidth*0.065,),
          textAlign: TextAlign.center,
        ),

    );
  }
}
