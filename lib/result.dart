import 'package:flutter/material.dart';
import 'Constant.dart';
import 'ReusedCard.dart';

class Bottombutton extends StatelessWidget {
  Bottombutton(this.txt);
  final String txt;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(

        child: Center(child: Text(txt)),

        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        color: bottomColour,
        height: 40.0,
      ),
    )
    ;
  }
}

class result extends StatelessWidget {
  result({required this.calculatetxt,required this.condition,required this.description});
  final String? calculatetxt;
  final String? condition;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text("BMI calculator"),

    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Text("Your Result",
            style: numberstyle,),
          Expanded(
            flex: 5,
            child: ReusedCard(colour: Widcolor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(calculatetxt!,
                style: textstyle,),
                Text(condition!,
                style: numberstyle,),
                Text(description!,
                style: textstyle,),
              ],
            ),
            ),
          ),
    Bottombutton("RECALCULATE")
        ],
      ),
    );
  }
}
