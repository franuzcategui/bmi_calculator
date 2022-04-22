import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String? bottomText;
  final Function? onTap;

  BottomButton({this.bottomText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        child: Center(
          child: Text(
            bottomText ?? '',
            style: kLargeButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 15),
        color: kBottomButtonColor,
        height: kBottomButtonHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
      ),
    );
  }
}
