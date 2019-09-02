import 'package:flutter/material.dart';

class AnswerBtn extends StatelessWidget {

  final Function haddleOnClick;
  final String btnTxt;

  AnswerBtn(this.haddleOnClick,this.btnTxt);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
          color: Colors.blue,
          child: Text(btnTxt),
          onPressed: haddleOnClick
      ),
    );
  }
}
