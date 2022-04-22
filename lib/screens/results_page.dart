import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String? status;
  final String? bmi;
  final String? interpretation;

  ResultsPage({this.status, this.bmi, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(top: 15.0, left: 10.0),
                  child: Text(
                    'Your Result',
                    style: kLargeTitleTextStyle,
                  ))),
          Expanded(
            flex: 7,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    status ?? ' ',
                    style: kBMITitleTextStyle,
                  ),
                  Text(
                    bmi ?? ' ',
                    style: kLargeNumberStyle,
                  ),
                  Text(
                    interpretation ?? ' ',
                    style: kBMIBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            bottomText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
