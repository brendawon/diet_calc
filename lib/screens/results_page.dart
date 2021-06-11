import 'package:diet_calc/constants.dart';
import 'package:diet_calc/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // allows access to arguments passed in through input_page
    Map args = ModalRoute.of(context)!.settings.arguments as Map;

    final lossKcal = args['simplifiedKcal'][0].toString() +
        '-' +
        args['simplifiedKcal'][1].toString() +
        ' kcals';
    final maintainKcal = args['simplifiedKcal'][1].toString() +
        '-' +
        args['simplifiedKcal'][2].toString() +
        ' kcals';
    final gainKcal = args['simplifiedKcal'][2].toString() +
        '-' +
        args['simplifiedKcal'][3].toString() +
        ' kcals';

    final ckdProtein = args['protein'][0].toString() +
        '-' +
        args['protein'][1].toString() +
        " g";
    final normalProtein = args['protein'][1].toString() +
        '-' +
        args['protein'][2].toString() +
        " g";
    final infectionProtein = args['protein'][2].toString() + " g";
    final hdProtein = args['protein'][2].toString() +
        '-' +
        args['protein'][4].toString() +
        " g";
    final woundsProtein = args['protein'][3].toString() +
        '-' +
        args['protein'][5].toString() +
        " g";

    final chfFluid =
        args['fluid'][0].toString() + '-' + args['fluid'][1].toString() + ' ml';
    final normalFluid =
        args['fluid'][1].toString() + '-' + args['fluid'][2].toString() + ' ml';
    final utiFluid = args['fluid'][3].toString() + ' ml';
    final woundsFluid =
        args['fluid'][3].toString() + '-' + args['fluid'][4].toString() + ' ml';

    return Scaffold(
      appBar: AppBar(
        title: Text('Estimated Needs'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'BMI',
                                  style: kTitleTextStyle,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  args['bmi'],
                                  style: kValueTextStyle,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  args['bmiTextResult'].toUpperCase(),
                                  style: kDescTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          args['bmiInterpretation'],
                          textAlign: TextAlign.center,
                          style: kInterpretationTextStyle,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Calories',
                          style: kTitleTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'MSJ x Activity Factor',
                          style: kDescTextStyle,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          args['kcal'].toString() + ' kcals',
                          style: kValueTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Simplified Caloric Needs',
                    style: kTitleTextStyle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Range',
                    style: kDescTextStyle,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            lossKcal,
                            style: kValueTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            maintainKcal,
                            style: kValueTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            gainKcal,
                            style: kValueTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'for weight loss',
                            style: kInterpretationTextStyle,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'for maintenance',
                            style: kInterpretationTextStyle,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'for weight gain',
                            style: kInterpretationTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Protein',
                          style: kTitleTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  ckdProtein,
                                  style: kProFluTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  normalProtein,
                                  style: kProFluTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  infectionProtein,
                                  style: kProFluTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  hdProtein,
                                  style: kProFluTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  woundsProtein,
                                  style: kProFluTextStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CKD',
                                  style: kInterpretationTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Normal',
                                  style: kInterpretationTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Infection',
                                  style: kInterpretationTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'HD',
                                  style: kInterpretationTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Wounds',
                                  style: kInterpretationTextStyle,
                                ),
                              ],
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
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Fluid',
                          style: kTitleTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  chfFluid,
                                  style: kProFluTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  normalFluid,
                                  style: kProFluTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  utiFluid,
                                  style: kProFluTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  woundsFluid,
                                  style: kProFluTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CHF',
                                  style: kInterpretationTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Normal',
                                  style: kInterpretationTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Infection',
                                  style: kInterpretationTextStyle,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Wounds',
                                  style: kInterpretationTextStyle,
                                ),
                              ],
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
        ],
      ),
    );
  }
}
