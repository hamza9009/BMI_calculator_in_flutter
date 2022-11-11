import 'dart:math';
class Calculation{
  Calculation({ this.height, this.weight});
  final int? height;
  final int? weight;


double? _bmi;

  String Calculatebmi(){
     _bmi = weight!/pow(height!/100, 2);
    return _bmi!.toStringAsFixed(1);
}

String? Getresult() {
  if (_bmi! >= 25) {
    return "Overwieght";
  }
  else if (_bmi! > 18) {
    return "Normal";
  }
  else {
    return "Underwieght";
  }
}
    String? Getdescription(){
      if(_bmi! >= 25){
        return "PLEASE STOP EATING,BLOODY MOOTY , DAFA HU RUNNING KAAR";
      }
      else if(_bmi! > 18){
        return "YOU ARE HEALTHY,KEEP IT UP";
      }
      else{
        return "ani diyia kuch kaahyia kaar ";
      }
    }
}


