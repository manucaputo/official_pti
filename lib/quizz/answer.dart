import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 10),
        child: ElevatedButton(
          child: Text(answerText,
              //maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(13, 78, 5, 0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontStyle: FontStyle.italic)),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(800, 65),
            maximumSize: const Size(800, 65),
            primary: const Color.fromRGBO(221, 229, 221, 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(
                  width: 5.0,
                  color: Color.fromRGBO(13, 78, 5, 0.6),
                )),
          ),
          onPressed: selectHandler,
        ),
      ),
    );
  }
}
