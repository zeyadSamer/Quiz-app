import 'package:quizzler_app/question.dart';


class QuizBrain{

  int _questionNumber=0;



  List <Question> questions=[
    Question('You can lead a cow down stairs but not upstairs',true) ,
    Question('Approximatly one quarter of human bones are in the feet',false),
    Question('A slug\'s blood is green',true)
  ];


  bool isAllAnswered(){
    if (_questionNumber < questions.length - 1) {
      return false;
    }
    return true;



  }
  void nextQuestion() {
    if (!this.isAllAnswered()) {
      _questionNumber++;

    }
  }

  String getQuestionText(){

    return questions[_questionNumber].question;

  }


  bool getQuestionAnswer(){

    return questions[_questionNumber].answer;

  }


  void resetQuiz(){

    this._questionNumber=0;

  }







}