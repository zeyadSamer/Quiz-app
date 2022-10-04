import 'package:flutter/material.dart';
import 'package:quizzler_app/Quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Scaffold(
        backgroundColor: Colors.black,
        body:QuizPage(),
      )


    );
  }
}







class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _State();
}

class _State extends State<QuizPage> {
  List<Icon> icons = [];

  QuizBrain quizBrain = new QuizBrain();

  void checkAnswer(userAnswer) {

      setState(() {


        bool allAnswered = quizBrain.isAllAnswered();

        if (!allAnswered) {
        bool correctAnswer = quizBrain.getQuestionAnswer();

        if (correctAnswer == userAnswer) {
          icons.add(Icon(Icons.check, color: Colors.green));
        } else {
          icons.add(Icon(
            Icons.close,
            color: Colors.red,

          ),
          );
        }

        quizBrain.nextQuestion();
      }else{
          Alert(
            context: context ,
            title: 'Finished!',
            desc: 'You\'ve reached the end of the quiz.',
          ).show();

          quizBrain.resetQuiz();
          icons=[];
        }


    });

    }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    flex: 12,
                    child: Center(
                      child: Text(
                        quizBrain.getQuestionText(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          checkAnswer(true);
                        },
                        child: Text('True',
                            style: TextStyle(
                              color: Colors.white,
                            ))),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {
                          checkAnswer(false);

                        },
                        child: Text('False',
                            style: TextStyle(
                              color: Colors.white,
                            ))),
                  ),
                ),
                Row(
                  children: icons,
                )
              ],
            ),
          );

  }
}
