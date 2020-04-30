import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableCardChild extends StatelessWidget {

  ReusableCardChild({@required this.icon, @required this.textContent});

  final IconData icon;
  final String textContent;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textContent,
          style: kLabelStyle,
        )
      ],
    );
  }
}