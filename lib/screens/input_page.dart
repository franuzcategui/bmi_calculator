import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/sex_content.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/bmi_calculator_brain.dart';

enum Gender {
  mars,
  venus,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 150;
  int weight = 200;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        color: (selectedGender == Gender.mars)
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.mars;
                          });
                        },
                        cardChild: SexCard(FontAwesomeIcons.mars, 'MALE')),
                  ),
                  Expanded(
                    child: ReusableCard(
                        color: (selectedGender == Gender.venus)
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.venus;
                          });
                        },
                        cardChild: SexCard(FontAwesomeIcons.venus, 'FEMALE')),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    color: kActiveCardColor,
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kCardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(height.toString(), style: kCardNumberStyle),
                            Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x2eB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            min: 120,
                            max: 220,
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    onPress: () {},
                    color: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kCardTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kCardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    color: kInactiveCardColor,
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kCardTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kCardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            BottomButton(
              bottomText: 'CALCULATE',
              onTap: () {
                BMICalculatorBrain bmiCalculator = BMICalculatorBrain(
                    weight: weight, height: height, age: age);

                String status = bmiCalculator.status();
                String interpretation = bmiCalculator.interpretation();
                String bmi = bmiCalculator.bmi();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              status: status,
                              bmi: bmi,
                              interpretation: interpretation,
                            )));
              },
            )
          ],
        ));
  }
}
