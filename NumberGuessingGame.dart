import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(GuessMyNumber());
}
class GuessMyNumber extends StatefulWidget {
  const GuessMyNumber({super.key});

  @override
  State<GuessMyNumber> createState() => _GuessMyNumberState();
}

class _GuessMyNumberState extends State<GuessMyNumber> {

  int _targetNumber = Random().nextInt(100) + 1;
  int? _guess;  //make _guess nullable
  int _attempts = 0;
  String _resultText = '';

  void _checkGuess(){
    setState(() {
      if(_guess == null){
        _resultText = 'Please enter a valid number.';
      }else{
        _attempts ++;  //Increment the attempts
        if(_guess == _targetNumber){
        _resultText = "Congratulations! You guessed the number in $_attempts attempts.";
        }else if(_guess! < _targetNumber){
          _resultText = "Try hegher";
        }else if(_guess! > _targetNumber){
          _resultText = "Try lower";
        }
      }
    });
  }

  final TextEditingController _textController = TextEditingController(); 

  void _resetGame(){
    setState(() {
      _targetNumber = Random().nextInt(100) + 1;
      _guess = null;
      _resultText = '';
      _textController.clear(); //Clear the text field
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Number Guessing Game"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Guess the number between 1 and 100:", style: TextStyle(fontSize: 18),),
              TextField(
                controller: _textController, //Assign the controller to the textField
                keyboardType: TextInputType.number,
                onChanged: (value) {  //onChanged is a callback function in Flutter that is used with input widgets
                  setState(() {
                    _guess = int.tryParse(value)!; //int.tryParse() is a dart method used to parse a string to an integer.
                  });
                },
              ),
              ElevatedButton(onPressed: _checkGuess, 
                child: Text("Check"),
              ),
              Text(_resultText, style: TextStyle(fontSize: 20),),
              ElevatedButton(onPressed: _resetGame, 
                child: Text("Restart Game"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}