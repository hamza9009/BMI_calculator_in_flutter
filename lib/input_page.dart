import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusedCard.dart';
import 'result.dart';
// import 'main.dart';
import 'Constant.dart';
import 'calulation.dart';

enum gender{
   male,
   female;
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class IconContent extends StatelessWidget {
  IconContent(this.icon,this.label);
  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(

          icon,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label!,
          style: TextStyle(fontSize: 18,color: Colors.white),)
      ],
    ),
    );
  }
}



class _MyHomePageState extends State<MyHomePage> {
   gender? selectedgender;
   int Heightt = 180;
   int weight = 50;
   int age = 10;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

          title: Text("BMI calculator"),

      ),
      body: Column(
        children: <Widget>[
          Row(
             children:<Widget>[
              Expanded(
                child:ReusedCard(
                  onPress: (){
                    setState(() {
                      selectedgender = gender.male;
                    });
                  },
                  colour: selectedgender == gender.male? activeCardColour : Widcolor,

                cardchild: IconContent(FontAwesomeIcons.mars,'Male'),
                ),
              ),

               Expanded(
                 child: ReusedCard(
                   onPress: (){
                     setState(() {
                       selectedgender = gender.female;
                     });
                   },
                   colour: selectedgender == gender.female? activeCardColour : Widcolor,
               cardchild: IconContent(FontAwesomeIcons.venus,'Female'),
               ),),
    ]
    ),
          Row(
            children:<Widget> [
              Expanded( child: ReusedCard(colour: Widcolor,
                cardchild: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,



                    children: [
                      Text("Height",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      ),
                      Row(
                        textBaseline: TextBaseline.ideographic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                      Text(Heightt.toString(),
                        style: numberstyle,
                      ),
                          Text("cm",
                            style: TextStyle(fontSize: 10,color: Colors.white),),

                      ],

                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,

                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0xFFEB1555),
                          thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0),
                        ),
                        child: Slider(value: Heightt.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            // activeColor: Color(0xFFEB1555),

                            onChanged: (double newvalue){
                          setState(() {
                            Heightt = newvalue.round();
                          });
                              // print(newvalue);
                            }),
                      )
                    ],

                  ),
                ),
              ),),

    ]
          ),
          Row(
              children:<Widget>[
                Expanded( child: ReusedCard(colour: Widcolor,
                  cardchild: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight",
                          style: textstyle,),
                        Text(weight.toString(),
                        style: numberstyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Iconbutton(
                              icon: FontAwesomeIcons.plus,
                          press: (){
                                setState(() {
                                  weight++;
                                });
                          },



                        ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Iconbutton(
                              icon: FontAwesomeIcons.minus,
                              press: (){
                                setState(() {
                                  weight--;
                                });
                              },



                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),),
                Expanded( child: ReusedCard(colour: Widcolor,
                  cardchild: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("age",
                          style: textstyle,),
                        Text(age.toString(),
                          style: numberstyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Iconbutton(
                              icon: FontAwesomeIcons.plus,
                              press: (){
                                setState(() {
                                  age++;
                                });
                              },



                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Iconbutton(
                              icon: FontAwesomeIcons.minus,
                              press: (){
                                setState(() {
                                  age--;
                                });
                              },



                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),),
              ]
          ),
          GestureDetector(
            onTap: (){
             Calculation cal = Calculation(height: Heightt,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => result(calculatetxt: cal.Calculatebmi(),condition: cal.Getresult(),description: cal.Getdescription(),),),);
            },
            child: Container(
              child: Center(child: Text("CALCULATE")),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              color: bottomColour,
              height: 40.0,
            ),
          )
        ],
      ),
    );

  }

  }
  class Iconbutton extends StatelessWidget {
     Iconbutton({required this.icon,required this.press});
    final VoidCallback press;
    final IconData icon;

    @override
    Widget build(BuildContext context) {
      return RawMaterialButton(onPressed: press,
      elevation: 10.0,
        child: Icon(icon),
        constraints: BoxConstraints.tightFor(
          height: 50,
          width:  50,
        ),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),


      );
    }
  }

