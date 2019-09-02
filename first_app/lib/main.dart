import 'package:flutter/material.dart';


import './Questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp> {

  int _index=0;
  int _totalScore=0;

  void _setAnswer(int score){

    _totalScore +=score;

    setState((){
      _index=_index+1;
    });

  }

  void _onReset(){
    _totalScore=0;
    setState((){
      _index=0;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    List<Map<String,Object>> _questions=[
      {
        'question':'your favorite color?',
        'answer':[{'text':"red",'score':10},{'text':'yellow','score':20},{'text':'blue','score':30}]
      }, {
       'question':'your favorite animal?',
        'answer':[{'text':"Ant",'score':10},{'text':'Dog','score':20},{'text':'Rabit','score':30}]
      }
    ];

    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
        ),
        body: Questions(_questions,_setAnswer,_index,_totalScore,_onReset),
      ),
    ));
  }
}
