import 'package:flutter/material.dart';
import '../constants.dart';

class SexCard extends StatelessWidget {
  final IconData icon;
  final String sex;

  SexCard(this.icon, this.sex);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          sex,
          style: kCardTextStyle,
        ),
      ],
    );
  }
}
