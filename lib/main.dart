import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
const bottomContainerHeight = 80.0;
const bottomColour = Color(0xFFEB1555);
const activeColour = Color(0xFF1D1E33);
const inactiveColour = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = inactiveColour;
  Color femaleCardColour = inactiveColour;

  //1 = male, 2 = female
  void updateColour(int gender){
    if (gender == 1){
      if(maleCardColour == inactiveColour){
        maleCardColour == activeColour;
      }
      else {
        maleCardColour = inactiveColour;
      }
    }
    if (gender == 2){
      if(femaleCardColour == inactiveColour){
        femaleCardColour == activeColour;
      }
      else {
        femaleCardColour = inactiveColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:  ReusableCard(
                      colour: colour,
                    cardChild: IconContent(cardIcon: FontAwesomeIcons.mars, cardText: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(colour: colour,
                      cardChild: IconContent(cardIcon: FontAwesomeIcons.venus, cardText: 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(colour: colour,),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(colour: colour,),
                  ),
                  Expanded(
                    child: ReusableCard(colour: colour,),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        ));
  }
}



