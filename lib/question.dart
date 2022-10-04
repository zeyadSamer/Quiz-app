class Question{

  String _question='';
  bool _answer=true;

  Question(String question,bool answer){
    this._question=question;
    this._answer=answer;


  }



  String get question{

    return _question;

  }

  bool get answer{
    return _answer;

  }



  void set question(String questionText) {



    this._question=questionText;




  }




}
