import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {

  CalculatorBrain({@required this.weight,@required this.height});
  final int weight;
  final int height;

  double _bmi;
  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi >= 25){
      return 'OverWeight';
    }else if(_bmi > 18){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have higher than normal body weight.Try to exercise more.';
    }else if(_bmi > 18){
      return 'You have a normal body weight.Good Job!';
    }else{
      return 'You have lower than normal body weight.You can eat bit more.';
    }
  }

}