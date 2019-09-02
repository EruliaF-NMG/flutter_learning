import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final int score;
  final Function onReset;

  Answer(this.score, this.onReset);

  String get scoreTxt {
    String value;
    if (score > 20) {
      value = "You are good...";
    } else {
      value = "You are bad...";
    }
    return value;
  }

//
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          scoreTxt,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        FlatButton(
          child: Text('Restart'),
          onPressed: onReset,
          textColor: Colors.blue,
        ),
      ],
    ));
  }
}
