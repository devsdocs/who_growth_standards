import 'dart:convert';
import 'dart:math';

import 'package:super_measurement/super_measurement.dart';
import 'package:who_growth_standards/src/common.dart';
import 'package:who_growth_standards/src/math.dart';
import 'package:who_growth_standards/src/typedef.dart';
import 'package:who_growth_standards/src/types.dart';

part '../data/bmianthro.dart';

class BodyMassIndexForAgeData {
  BodyMassIndexForAgeData()
      : data = (json.decode(_bmianthro) as Map<String, dynamic>).map(
          (x, e) => MapEntry(
            x,
            BodyMassIndexForAgeGender(
              ageData: (e as Map<String, dynamic>).map((x, y) {
                y as Map<String, dynamic>;
                return MapEntry(
                  x,
                  BodyMassIndexForAgeLMS(
                    lms: (l: y['l'], m: y['m'], s: y['s']),
                    loh: y['loh'].toString().toLowerCase() == 'l'
                        ? Measure.recumbent
                        : Measure.standing,
                  ),
                );
              }),
            ),
          ),
        );

  final Map<String, BodyMassIndexForAgeGender> data;
}

class BodyMassIndexMeasurement {
  const BodyMassIndexMeasurement._(this.value);

  factory BodyMassIndexMeasurement.fromMeasurement({
    required Length lengthHeight,
    required Mass mass,
    required Measure measure,
    required Age age,
  }) {
    final toMeterSquare = pow(
      Centimeters(
        adjustedLengthHeight(
          ageInDays: age.totalDays,
          measure: measure,
          lengthHeight: lengthHeight.toCentimeters.value!,
        ),
      ).toMeters.value!,
      2,
    );
    final toKg = mass.toKilograms.value!;

    return BodyMassIndexMeasurement._(toKg / toMeterSquare);
  }

  factory BodyMassIndexMeasurement.fromValue(num value) =>
      BodyMassIndexMeasurement._(value);

  final num value;
}

class BodyMassIndexForAge {
  BodyMassIndexForAge._({
    required Sex sex,
    required Age age,
    required BodyMassIndexMeasurement measurementResult,
    required BodyMassIndexForAgeData bodyMassIndexData,
  })  : _bodyMassIndexMeasurementResult = measurementResult,
        _sex = sex,
        _age = age,
        _mapGender = bodyMassIndexData.data {
    if (!(_age.totalDays >= 0 && _age.totalDays <= 1856)) {
      throw Exception('Final age must be in range of 0 - 1856 days');
    }
  }

  factory BodyMassIndexForAge.male({
    required Age age,
    required BodyMassIndexMeasurement bodyMassIndexMeasurement,
    required BodyMassIndexForAgeData bodyMassIndexData,
  }) =>
      BodyMassIndexForAge._(
        sex: Sex.male,
        age: age,
        measurementResult: bodyMassIndexMeasurement,
        bodyMassIndexData: bodyMassIndexData,
      );

  factory BodyMassIndexForAge.female({
    required Age age,
    required BodyMassIndexMeasurement bodyMassIndexMeasurementResult,
    required BodyMassIndexForAgeData bodyMassIndexData,
  }) =>
      BodyMassIndexForAge._(
        sex: Sex.female,
        age: age,
        measurementResult: bodyMassIndexMeasurementResult,
        bodyMassIndexData: bodyMassIndexData,
      );

  final Sex _sex;
  final Age _age;
  final BodyMassIndexMeasurement _bodyMassIndexMeasurementResult;

  final Map<String, BodyMassIndexForAgeGender> _mapGender;

  BodyMassIndexForAgeGender get _maleData => _mapGender['1']!;
  BodyMassIndexForAgeGender get _femaleData => _mapGender['2']!;

  BodyMassIndexForAgeLMS get _ageData =>
      (_sex == Sex.male ? _maleData : _femaleData)
          .ageData[_age.totalDays.toString()]!;

  num get zScore => adjustedZScore(
        y: _bodyMassIndexMeasurementResult.value,
        l: _ageData.lms.l,
        m: _ageData.lms.m,
        s: _ageData.lms.s,
      );
}

class BodyMassIndexForAgeGender {
  BodyMassIndexForAgeGender({required this.ageData});

  final Map<String, BodyMassIndexForAgeLMS> ageData;
}

class BodyMassIndexForAgeLMS {
  BodyMassIndexForAgeLMS({
    required this.lms,
    required this.loh,
  });
  final LMS lms;
  final Measure loh;
}
