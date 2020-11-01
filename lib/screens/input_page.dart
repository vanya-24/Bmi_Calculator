import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../bmi_calculator.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      colour: selectedGender == GenderType.male ? kActiveCardColor :kInactiveCardColor,
                      cardchild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      colour:selectedGender == GenderType.female ? kActiveCardColor :kInactiveCardColor,
                      cardchild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour:kInactiveCardColor,
                cardchild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberstyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),

                      ],
                    ),
                    SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                        overlayColor:Color(0x29EB1555) ,
                        activeTrackColor:Colors.white ,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor:Color(0xFFEB1555) ,
                        thumbShape:RoundSliderThumbShape(enabledThumbRadius:15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(colour:kInactiveCardColor,
                    cardchild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text(
                         'WEIGHT',
                       style: kLabelTextStyle,
                       ),
                       Text(weight.toString(),
                       style:kNumberstyle,),
                       Row(
                         mainAxisAlignment:  MainAxisAlignment.center,
                         children: <Widget>[
                           RoundIconButton(
                             icon:FontAwesomeIcons.minus,
                             onPressed: (){
                               setState(() {
                                 weight--;
                               });
                             },
                           ),
                           SizedBox(width: 10.0,),
                           RoundIconButton(
                             icon:FontAwesomeIcons.plus,
                             onPressed: (){
                               setState(() {
                                 weight++;
                               });
                             },
                           ),
                         ],
                       ),

                     ],
                    ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(colour:kInactiveCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                          ),
                        Text(
                          age.toString(),
                          style: kNumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onTap: (){
                CalculatorBrain calc =CalculatorBrain(weight: weight,height: height);

              Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    resultInterpretation: calc.getInterpretation(),
                  )));
            },
              buttonTitle: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}



