part of '../standard.dart';

class LengthForAgeData {
  factory LengthForAgeData() => _singleton;
  LengthForAgeData._()
      : _data = (json.decode(_lenanthro) as Map<String, dynamic>).map(
          (k1, v1) => MapEntry(
            k1,
            LengthForAgeGender(
              ageData: (v1 as Map<String, dynamic>).map((k2, v2) {
                v2 as Map<String, dynamic>;
                return MapEntry(
                  k2,
                  LengthForAgeLMS(
                    lms: (l: v2['l'], m: v2['m'], s: v2['s']),
                    loh: v2['loh'].toString().toLowerCase() == 'l'
                        ? LengthHeigthMeasurementPosition.recumbent
                        : LengthHeigthMeasurementPosition.standing,
                  ),
                );
              }),
            ),
          ),
        );
  static final _singleton = LengthForAgeData._();

  final Map<String, LengthForAgeGender> _data;
}

class LengthForAge {
  LengthForAge({
    required Sex sex,
    required Age age,
    required Length lengthHeight,
    required LengthHeigthMeasurementPosition measure,
    required LengthForAgeData lengthForAgeData,
  })  : _lengthHeight = lengthHeight,
        _measure = measure,
        _sex = sex,
        _age = age,
        _mapGender = lengthForAgeData._data {
    if (!(_age.ageInTotalDaysByNow >= 0 && _age.ageInTotalDaysByNow <= 1856)) {
      throw Exception('Age must be in range of 0 - 1856 days');
    }
  }

  final Sex _sex;
  final Age _age;
  final Length _lengthHeight;
  final LengthHeigthMeasurementPosition _measure;
  final Map<String, LengthForAgeGender> _mapGender;

  LengthForAgeGender get _maleData => _mapGender['1']!;
  LengthForAgeGender get _femaleData => _mapGender['2']!;

  LengthForAgeLMS get _ageData => (_sex == Sex.male ? _maleData : _femaleData)
      .ageData[_age.ageInTotalDaysByNow.toString()]!;

  num get _zScore => zscore(
        y: adjustedLengthHeight(
          lengthHeight: _lengthHeight.toCentimeters.value!,
          ageInDays: _age.ageInTotalDaysByNow,
          measure: _measure,
        ),
        l: _ageData.lms.l,
        m: _ageData.lms.m,
        s: _ageData.lms.s,
      );

  num get zScore => _zScore.toDouble().toPrecision(2);

  num get percentile => zScoreToPercentile(zScore).toDouble().toPrecision(2);
}

class LengthForAgeGender {
  LengthForAgeGender({required this.ageData});
  final Map<String, LengthForAgeLMS> ageData;
}

class LengthForAgeLMS {
  LengthForAgeLMS({
    required this.lms,
    required this.loh,
  });
  final LMS lms;
  final LengthHeigthMeasurementPosition loh;
}
