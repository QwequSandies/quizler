import 'package:flutter/material.dart';
import 'package:quizler/quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.white,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool correctanswer = quizBrain.getQuestionAnswer();
                  if (correctanswer == true) {
                    print('You got it right');
                  } else {
                    print('You got it wrong');
                  }
                  quizBrain.getNextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              color: Colors.white,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                bool correctanswer = quizBrain.getQuestionAnswer();

                if (correctanswer == false) {
                  print('You got it right');
                } else {
                  print('You got it wrong');
                }
                setState(() {
                  quizBrain.getNextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}
