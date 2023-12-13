import 'dart:convert';

import 'package:who_growth_standards/src/common.dart';
import 'package:who_growth_standards/src/math.dart';
import 'package:who_growth_standards/src/typedef.dart';
import 'package:who_growth_standards/src/types.dart';

part '../data/hcanthro.dart';

class HeadCircumferenceForAgeData {
  HeadCircumferenceForAgeData()
      : data = (json.decode(_hcanthro) as Map<String, dynamic>).map(
          (u, e) => MapEntry(
            u,
            HeadCircumferenceForAgeGender(
              ageData: (e as Map<String, dynamic>).map((x, y) {
                y as Map<String, dynamic>;
                return MapEntry(
                  x,
                  HeadCircumferenceForAgeLMS(
                    lms: (l: y['l'], m: y['m'], s: y['s']),
                  ),
                );
              }),
            ),
          ),
        );

  final Map<String, HeadCircumferenceForAgeGender> data;
}

class HeadCircumferenceForAge {
  HeadCircumferenceForAge._({
    required Sex sex,
    required Age age,
    required num measurementResult,
    required HeadCircumferenceForAgeData headCircumferenceData,
  })  : _measurementResult = measurementResult,
        _sex = sex,
        _age = age,
        _mapGender = headCircumferenceData.data {
    if (!(_age.totalDays >= 0 && _age.totalDays <= 1856)) {
      throw Exception('Final age must be in range of 0 - 1856 days');
    }
  }

  factory HeadCircumferenceForAge.male({
    required Age age,
    required num measurementResult,
    required HeadCircumferenceForAgeData headCircumferenceData,
  }) =>
      HeadCircumferenceForAge._(
        sex: Sex.male,
        age: age,
        measurementResult: measurementResult,
        headCircumferenceData: headCircumferenceData,
      );

  factory HeadCircumferenceForAge.female({
    required Age age,
    required num measurementResult,
    required HeadCircumferenceForAgeData headCircumferenceData,
  }) =>
      HeadCircumferenceForAge._(
        sex: Sex.female,
        age: age,
        measurementResult: measurementResult,
        headCircumferenceData: headCircumferenceData,
      );

  final Sex _sex;
  final Age _age;
  final num _measurementResult;
  final Map<String, HeadCircumferenceForAgeGender> _mapGender;

  HeadCircumferenceForAgeGender get _maleData => _mapGender['1']!;
  HeadCircumferenceForAgeGender get _femaleData => _mapGender['2']!;

  HeadCircumferenceForAgeLMS get _ageData =>
      (_sex == Sex.male ? _maleData : _femaleData)
          .ageData[_age.totalDays.toString()]!;

  num get zScore => zscore(
        y: _measurementResult,
        l: _ageData.lms.l,
        m: _ageData.lms.m,
        s: _ageData.lms.s,
      );
}

class HeadCircumferenceForAgeGender {
  HeadCircumferenceForAgeGender({required this.ageData});

  final Map<String, HeadCircumferenceForAgeLMS> ageData;
}

class HeadCircumferenceForAgeLMS {
  HeadCircumferenceForAgeLMS({
    required this.lms,
  });
  final LMS lms;
}
