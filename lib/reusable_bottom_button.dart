import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, @required this.title});

  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
              title,
              style: kLargeButtonTextStyle
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}