import 'package:bmi_calculator/constants.dart';
import '../components /reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';


class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.resultText,@required this.resultInterpretation});
  final String bmiResult;
  final String resultText;
  final String resultInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kResultTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                   resultInterpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
          onTap: (){
                Navigator.pop(context);
              },
                buttonTitle: 'RE-CALCULATE',
              ),
        ],
      ),
    );
  }
}
