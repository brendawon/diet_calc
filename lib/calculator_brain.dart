import 'dart:math';

class CalculatorBrain {
  double? _bmi;

  CalculatorBrain(
      {required this.height,
      required this.htUnit,
      required this.weight,
      required this.wtUnit,
      this.activityFactor,
      this.gender,
      this.age});

  final int height;
  final String htUnit;
  final double weight;
  final String wtUnit;
  final double? activityFactor;
  final String? gender;
  final int? age;

  String calculateBMI() {
    int htInCm;
    double wtInKg;
    htInCm = height;
    wtInKg = weight;
    if (htUnit == 'in' && wtUnit == 'lbs') {
      htInCm = (height * 2.54).round();
    }
    if (wtUnit == 'lbs') {
      wtInKg = (weight / 2.205);
    }
    _bmi = (wtInKg / pow(htInCm / 100, 2));
    return _bmi!.toStringAsFixed(1);
  }

  String getBMITextResult() {
    if (_bmi! >= 30) {
      return 'Obese';
    } else if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String bmiInterpretation() {
    if (_bmi! >= 40) {
      return 'Class 3 obesity; morbidly obese';
    } else if (_bmi! >= 35) {
      return 'Class 2 obesity; check for comorbidities';
    } else if (_bmi! >= 30) {
      return 'Class 1 obesity';
    } else if (_bmi! >= 25 && _bmi! <= 27) {
      return 'Overweight status; ideal for ages 65+';
    } else if (_bmi! >= 25) {
      return 'Overweight status';
    }
    if (_bmi! >= 20) {
      return 'Normal weight status';
    }
    if (_bmi! >= 18.5) {
      return 'On low end of normal weight status';
    } else {
      return 'Underweight status';
    }
  }

  List simplifiedRange() {
    double wtInKg;
    wtInKg = weight;
    if (wtUnit == 'lbs') {
      wtInKg = (weight / 2.205);
    }
    // index 0 - index 1 = for wt loss; index 1 - index 2 = for wt maintenance; index 2 - index 3 = for wt gain
    return [
      (wtInKg * 20).round(),
      (wtInKg * 25).round(),
      (wtInKg * 30).round(),
      (wtInKg * 35).round()
    ];
  }

  // Mifflin-St. Jeor * activity factor
  dynamic calculateKcal() {
    //convert to cm and kg
    int htInCm;
    double wtInKg;
    htInCm = height;
    wtInKg = weight;
    if (htUnit == 'in' && wtUnit == 'lbs') {
      htInCm = (height * 2.54).round();
    }
    if (wtUnit == 'lbs') {
      wtInKg = (weight / 2.205);
    }

    if (gender == 'male') {
      return ((((10 * wtInKg) + (6.25 * htInCm) - (5 * age!)) + 5) *
              activityFactor!)
          .round();
    } else if (gender == 'female') {
      return ((((10 * wtInKg) + (6.25 * htInCm) - (5 * age!)) - 161) *
              activityFactor!)
          .round();
    } else {
      return ('Unable to calculate without all field inputs. See Simplified Energy Needs for a general caloric range.');
    }
  }

  List proteinRange() {
    double wtInKg;
    wtInKg = weight;
    if (wtUnit == 'lbs') {
      wtInKg = (weight / 2.205);
    }
    // index 0 - index 1 = CKD; index 1 - index 2 = normal; index 2 = infection; index 2 - index 4 = for dialysis; index 3 - index 5 = multiple wounds
    return [
      (wtInKg * 0.8).round(),
      (wtInKg * 1.0).round(),
      (wtInKg * 1.2).round(),
      (wtInKg * 1.25).round(),
      (wtInKg * 1.4).round(),
      (wtInKg * 1.5).round(),
    ];
  }

  List fluidRange() {
    double wtInKg;
    wtInKg = weight;
    if (wtUnit == 'lbs') {
      wtInKg = (weight / 2.205);
    }
    // index 0 - index 1 = CHF; index 1 - index 2 = normal; index 3 = UTI; index 3 - index 4 = multiple wounds
    return [
      (wtInKg * 20).round(),
      (wtInKg * 25).round(),
      (wtInKg * 30).round(),
      (wtInKg * 35).round(),
      (wtInKg * 40).round(),
    ];
  }
}
