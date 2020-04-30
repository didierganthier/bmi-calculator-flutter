import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_bottom_button.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
              child: Center(
                child: Container(
                    child: Text('Your Result', style: kResultTextStyle,)
                ),
              ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                  colour: kActiveCardColor,
                cardChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          resultText.toUpperCase(),
                          style: kResultWeightTextStyle
                      ),
                      Text(
                        bmiResult,
                        style: kResultNumberTextStyle
                      ),
                      Text(
                        interpretation,
                        style: kLargeButtonTextStyle, textAlign: TextAlign.center
                      )
                    ],
                  ),
                ),
              )
          ),
          BottomButton(
              onTap: (){
                Navigator.pop(context);
                },
              title: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
