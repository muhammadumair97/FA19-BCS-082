import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;
  String calculateBMI() {
    _bmi = pow(weight,height);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi <= 500000) {
      return 'Normal';
    } else {
      return 'high';
    }
  }

  String getInterpretation() {
    if (_bmi <=50000) {
      return 'value is in normal range';
    }  else {
      return 'value ';
    }
  }
}
