import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 20) {
      resultText = 'Chief you try';
    } else if (resultScore <= 30) {
      resultText = 'Nice one ';
    }else if (resultScore <= 40) {
      resultText = 'Great one ';
    } else {
      resultText = 'You are smart!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          onPressed:  (){
            resetHandler.call();
          },
          child: Text(
              'Restart Quiz'
          ),
          textColor: Colors.blue,
        )
      ],
    ));
  }
}
