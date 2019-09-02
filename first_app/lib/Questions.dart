import 'package:flutter/material.dart';

import './AnswerBtn.dart';
import './QuestionText.dart';
import './Answer.dart';


class Questions extends StatelessWidget {

  final int index;
  final int score;
  final List<Map<String,Object>> questions;
  final Function haddleOnClick;
  final Function onReset;

  Questions(this.questions,this.haddleOnClick,this.index,this.score,this.onReset);

  @override
  Widget build(BuildContext context) {
    return (index < questions.length)? Column(
      children: <Widget>[
        QuestionText(questions[index]['question']),
        ...(questions[index]['answer'] as List<Map<String,Object>>).map((answer){
          return  AnswerBtn(()=>haddleOnClick(answer['score']),answer['text']);
        }).toList()
      ],
    ):Answer(score,onReset);
  }
}
