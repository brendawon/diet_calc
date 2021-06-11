import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _height = 0;
  double _weight = 0.0;
  int age = 0;
  double activityFactor = 1.2;
  String activityDesc = 'Sedentary';

  String selectedGender = '';
  String selectedWtUnit = 'lbs';
  String selectedHtUnit = 'in';
  String selectedFactor = 'activity';

  final htController = TextEditingController();
  final wtController = TextEditingController();
  final ageController = TextEditingController();

  //Todo: setstate to save options

  void showSelection(gender) {
    gender == selectedGender ? selectedGender = '' : selectedGender = gender;
  }

  void showWtUnit(wtUnit) {
    wtUnit == selectedWtUnit ? selectedWtUnit = '' : selectedWtUnit = wtUnit;
  }

  void convertWtTo(String unit, double weight) {
    if (unit == 'kg') {
      _weight = double.parse((_weight / 2.205).toStringAsFixed(1));
    } else {
      _weight = double.parse((_weight * 2.205).toStringAsFixed(1));
    }
    wtController.text = _weight.toString();
  }

  void showHtUnit(htUnit) {
    htUnit == selectedHtUnit ? selectedHtUnit = '' : selectedHtUnit = htUnit;
  }

  void convertHtTo(String unit, int height) {
    if (unit == 'cm') {
      _height = (_height * 2.54).round();
    } else {
      _height = (_height / 2.54).round();
    }
    htController.text = _height.toString();
  }

  void showActivityOrStress(factor) {
    factor == selectedFactor ? selectedFactor = '' : selectedFactor = factor;
  }

  void changeFactorDesc(activityFactor) {
    if (selectedFactor == 'activity') {
      if (activityFactor < 1.0) {
        activityDesc = 'Bedridden';
      } else if (activityFactor <= 1.2) {
        activityDesc = 'Sedentary';
      } else if (activityFactor <= 1.3) {
        activityDesc = 'Ambulatory';
      } else if (activityFactor <= 1.4) {
        activityDesc = 'Light Activity';
      } else if (activityFactor <= 1.55) {
        activityDesc = 'Moderate Exercise';
      } else if (activityFactor <= 1.75) {
        activityDesc = 'Intense Exercise';
      } else {
        activityDesc = 'Athlete';
      }
    } else {
      if (activityFactor < 1.0) {
        activityDesc = 'Malnutrition';
      } else if (activityFactor <= 1.2) {
        activityDesc = 'Minor Infection';
      } else if (activityFactor <= 1.3) {
        activityDesc = 'Fracture, Peritonitis';
      } else if (activityFactor <= 1.4) {
        activityDesc = 'Cancer Cachexia, Major Surgery';
      } else if (activityFactor <= 1.5) {
        activityDesc = 'Multiple Pressure Injuries';
      } else if (activityFactor <= 1.75) {
        activityDesc = 'Sepsis';
      } else {
        activityDesc = 'Thermal Injury';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DietCalc'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        showSelection('male');
                      });
                    },
                    color: selectedGender == 'male'
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      subtitle: 'MALE',
                      iconColor: selectedGender == 'male'
                          ? kActiveIconColor
                          : kInactiveIconColor,
                      subtitleStyle: selectedGender == 'male'
                          ? kChosenItemTextStyle
                          : kLabelTextStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        TextFormField(
                          controller: ageController,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onFieldSubmitted: (value) {
                            age = int.parse(ageController.text);
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            hintText: 'Enter age',
                            hintStyle: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0x33686F7A),
                            ),
                          ),
                          style: kNumberTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'yrs',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        showSelection('female');
                      });
                    },
                    color: selectedGender == 'female'
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      subtitle: 'FEMALE',
                      iconColor: selectedGender == 'female'
                          ? kActiveIconColor
                          : kInactiveIconColor,
                      subtitleStyle: selectedGender == 'female'
                          ? kChosenItemTextStyle
                          : kLabelTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Todo: add activity factor (this can be a slider)
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (selectedFactor == 'stress') {
                                  setState(() {
                                    showActivityOrStress('activity');
                                    changeFactorDesc(activityFactor);
                                  });
                                }
                              },
                              child: Text(
                                'Activity Factor',
                                style: selectedFactor == 'activity'
                                    ? kChosenItemTextStyle
                                    : kLabelTextStyle,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (selectedFactor == 'activity') {
                                  setState(() {
                                    showActivityOrStress('stress');
                                    changeFactorDesc(activityFactor);
                                  });
                                }
                              },
                              child: Text(
                                'Stress Factor',
                                style: selectedFactor == 'stress'
                                    ? kChosenItemTextStyle
                                    : kLabelTextStyle,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              activityFactor.toString(),
                              style: kNumberTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kInactiveIconColor,
                            thumbColor: kBottomContainerColor,
                            overlayColor: Color(0x2946C28E),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 10.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                            value: activityFactor,
                            min: 0.8,
                            max: 2.0,
                            onChanged: (double newValue) {
                              setState(() {
                                activityFactor =
                                    double.parse(newValue.toStringAsFixed(2));
                                changeFactorDesc(activityFactor);
                              });
                            },
                          ),
                        ),
                        Text(
                          activityDesc,
                          style: TextStyle(
                            color: Color(0xFF13D3F5),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        TextFormField(
                          controller: htController,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (value) {
                            _height = int.parse(htController.text);
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            hintText: 'Enter ht',
                            hintStyle: kHintStyle,
                          ),
                          style: kNumberTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                // if unit currently is different, change it, if it is the same, do nothing
                                if (selectedHtUnit == 'in') {
                                  setState(() {
                                    convertHtTo('cm', _height);
                                    showHtUnit('cm');
                                  });
                                }
                              },
                              child: Text(
                                'cm',
                                style: selectedHtUnit == 'cm'
                                    ? kChosenItemTextStyle
                                    : kLabelTextStyle,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (selectedHtUnit == 'cm') {
                                  setState(() {
                                    convertHtTo(
                                        'in', int.parse(htController.text));
                                    showHtUnit('in');
                                  });
                                }
                              },
                              child: Text(
                                'in',
                                style: selectedHtUnit == 'in'
                                    ? kChosenItemTextStyle
                                    : kLabelTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        TextFormField(
                          controller: wtController,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onFieldSubmitted: (value) {
                            _weight = double.parse(wtController.text);
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            hintText: 'Enter wt',
                            hintStyle: kHintStyle,
                          ),
                          style: kNumberTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                if (selectedWtUnit == 'lbs') {
                                  setState(() {
                                    convertWtTo(
                                        'kg', double.parse(wtController.text));
                                    showWtUnit('kg');
                                  });
                                }
                              },
                              child: Text(
                                'kg',
                                style: selectedWtUnit == 'kg'
                                    ? kChosenItemTextStyle
                                    : kLabelTextStyle,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (selectedWtUnit == 'kg') {
                                  setState(() {
                                    convertWtTo(
                                        'lbs', double.parse(wtController.text));
                                    showWtUnit('lbs');
                                  });
                                }
                              },
                              child: Text(
                                'lbs',
                                style: selectedWtUnit == 'lbs'
                                    ? kChosenItemTextStyle
                                    : kLabelTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), //
          BottomButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  height: _height,
                  htUnit: selectedHtUnit,
                  weight: _weight,
                  wtUnit: selectedWtUnit,
                  activityFactor: activityFactor,
                  gender: selectedGender,
                  age: age);
              Navigator.pushNamed(
                context,
                '/results',
                arguments: {
                  'bmi': calc.calculateBMI(),
                  'bmiTextResult': calc.getBMITextResult(),
                  'bmiInterpretation': calc.bmiInterpretation(),
                  'kcal': calc.calculateKcal(),
                  'simplifiedKcal': calc.simplifiedRange(),
                  'protein': calc.proteinRange(),
                  'fluid': calc.fluidRange()
                },
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
