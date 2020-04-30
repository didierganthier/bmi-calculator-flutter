import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_bottom_button.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/reusable_card_child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male,
  female
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 21;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                          colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                          cardChild: ReusableCardChild(
                            icon: FontAwesomeIcons.mars,
                            textContent: 'MALE',
                          ),
                         onPress: (){
                            setState(() {
                              selectedGender = Gender.male;
                            });
                        },
                      )
                  ),
                  Expanded(
                      child: ReusableCard(
                          colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                          cardChild: ReusableCardChild(
                            icon: FontAwesomeIcons.venus,
                            textContent: 'FEMALE',
                          ),
                         onPress: (){
                            setState(() {
                              selectedGender = Gender.female;
                            });
                        },
                      ),
                  )
                ],
              )
            ),
          Expanded(
                child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HEIGHT', style: kLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                                height.toString(),
                                style: kNumberTextStyle
                            ),
                            Text(
                              'cm',
                              style: kLabelStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8D8E98),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                            overlayColor: Color(0x29EB1555)
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: kMinSliderValue,
                              max: kMaxSliderValue,
                              onChanged: (double newValue){
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                          ),
                        )
                      ],
                    ),
                )
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                          colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT', style: kLabelStyle,),
                            Text(weight.toString(), style: kNumberTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               RoundIconButton(
                                   child: FontAwesomeIcons.minus,
                                   buttonPressed:(){
                                     setState(() {
                                       weight--;
                                     });
                                   },
                               ),
                                SizedBox(
                                  width: 10.0
                                ),
                                RoundIconButton(
                                    child: FontAwesomeIcons.plus,
                                    buttonPressed:(){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      child: ReusableCard(
                          colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('AGE', style: kLabelStyle,),
                            Text(age.toString(), style: kNumberTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    child: FontAwesomeIcons.minus,
                                  buttonPressed: (){
                                      setState(() {
                                        age--;
                                      });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0
                                ),
                                RoundIconButton(
                                  child: FontAwesomeIcons.plus,
                                  buttonPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  }
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  )
                ],
              )
          ),
          BottomButton(
            onTap:() {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      )
                  )
                );
              },
            title: 'CALCULATE',
          )
        ],
      )
    );
  }
}


class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.child, @required this.buttonPressed});

  final IconData child;
  final Function buttonPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: buttonPressed,
      child: Icon(child, color: Colors.white,),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
