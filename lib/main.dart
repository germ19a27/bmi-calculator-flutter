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

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = inactiveColour;
  Color femaleCardColour = inactiveColour;

  //1 = male, 2 = female
  void updateColour(Gender selectedGender ){
    if (selectedGender == Gender.male){
      if(maleCardColour == inactiveColour){
        maleCardColour = activeColour;
        femaleCardColour = inactiveColour;
      }
      else {
        maleCardColour = inactiveColour;
      }
    }
    if (selectedGender == Gender.female){
      if(femaleCardColour == inactiveColour){
        femaleCardColour = activeColour;
        maleCardColour =inactiveColour;
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
                    child:  GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColour(Gender.male);
                        });
                      },
                      child: ReusableCard(
                        colour: maleCardColour,
                      cardChild: IconContent(cardIcon: FontAwesomeIcons.mars, cardText: 'MALE'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColour(Gender.female);
                        });
                      },
                      child: ReusableCard(colour: femaleCardColour,
                        cardChild: IconContent(cardIcon: FontAwesomeIcons.venus, cardText: 'FEMALE'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(colour: inactiveColour,),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(colour: inactiveColour,),
                  ),
                  Expanded(
                    child: ReusableCard(colour: inactiveColour,),
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



