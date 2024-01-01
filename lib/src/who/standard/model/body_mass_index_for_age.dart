part of '../standard.dart';

class BodyMassIndexForAgeData {
  factory BodyMassIndexForAgeData() => _singleton;
  const BodyMassIndexForAgeData._(this._data);

  static final _singleton = BodyMassIndexForAgeData._(_parse());

  static Map<Sex, _BodyMassIndexForAgeGender> _parse() =>
      _bmianthro.toJsonObjectAsMap.map(
        (k1, v1) => MapEntry(
          k1 == '1' ? Sex.male : Sex.female,
          _BodyMassIndexForAgeGender(
            ageData: (v1 as Map<String, dynamic>).map((k2, v2) {
              v2 as Map<String, dynamic>;
              final lms =
                  (l: v2['l'] as num, m: v2['m'] as num, s: v2['s'] as num);
              return MapEntry(
                int.parse(k2),
                _BodyMassIndexForAgeLMS(
                  lms: lms,
                  percentileCutOff: lms.percentileCutOff,
                  standardDeviationCutOff: lms.stDevCutOff,
                  loh: v2['loh'].toString().toLowerCase() == 'l'
                      ? LengthHeigthMeasurementPosition.recumbent
                      : LengthHeigthMeasurementPosition.standing,
                ),
              );
            }),
          ),
        ),
      );

  final Map<Sex, _BodyMassIndexForAgeGender> _data;
  Map<Sex, _BodyMassIndexForAgeGender> get data => _data;

  @override
  String toString() => 'Body Mass Index For Age Data($_data)';
}

@freezed
class BodyMassIndexMeasurement with _$BodyMassIndexMeasurement {
  factory BodyMassIndexMeasurement(num value, {required Age age}) =
      _BodyMassIndexMeasurement;
  const BodyMassIndexMeasurement._();

  factory BodyMassIndexMeasurement.fromMeasurement({
    @LengthConverter() required Length lengthHeight,
    @MassConverter() required Mass weight,
    required LengthHeigthMeasurementPosition measure,
    required Age age,
  }) {
    final adjustedLength = whoAdjustedLengthHeight(
      age: age,
      measure: measure,
      lengthHeight: lengthHeight,
    );

    final bmi = BodyMassIndex(lengthHeight: adjustedLength, weight: weight);

    return BodyMassIndexMeasurement(
      bmi.value,
      age: age,
    );
  }

  factory BodyMassIndexMeasurement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BodyMassIndexMeasurementFromJson(json);
}

@freezed
class BodyMassIndexForAge with _$BodyMassIndexForAge {
  @Assert(
    'bodyMassIndexMeasurement.age.ageInTotalDaysByNow >= 0 && bodyMassIndexMeasurement.age.ageInTotalDaysByNow <= 1856',
    'Age must be in range of 0 - 1856 days',
  )
  @Assert(
    'observationDate == null || observationDate.isSameOrBefore(Date.today()) || observationDate.isSameOrAfter(bodyMassIndexMeasurement.age.dateOfBirth)',
    'Observation date is impossible, because happen after today or before birth',
  )
  factory BodyMassIndexForAge({
    Date? observationDate,
    required Sex sex,
    @BodyMassIndexMeasurementConverter()
    required BodyMassIndexMeasurement bodyMassIndexMeasurement,
  }) = _BodyMassIndexForAge;

  const BodyMassIndexForAge._();

  factory BodyMassIndexForAge.fromJson(Map<String, dynamic> json) =>
      _$BodyMassIndexForAgeFromJson(json);

  BodyMassIndexForAgeData get _bodyMassIndexData => BodyMassIndexForAgeData();

  _BodyMassIndexForAgeGender get _maleData =>
      _bodyMassIndexData._data[Sex.male]!;
  _BodyMassIndexForAgeGender get _femaleData =>
      _bodyMassIndexData._data[Sex.female]!;

  _BodyMassIndexForAgeLMS get _ageData =>
      (sex == Sex.male ? _maleData : _femaleData)
          .ageData[_ageAtObservationDate.ageInTotalDaysByNow]!;

  num get _zScore =>
      _ageData.lms.adjustedZScore(bodyMassIndexMeasurement.value);

  Age get _ageAtObservationDate => observationDate == null
      ? bodyMassIndexMeasurement.age
      : observationDate == Date.today()
          ? bodyMassIndexMeasurement.age
          : bodyMassIndexMeasurement.age.ageAtPastDate(observationDate!);

  num zScore([
    Precision precision = Precision.ten,
  ]) =>
      _zScore.precision(precision);

  num percentile([
    Precision precision = Precision.ten,
  ]) =>
      (pnorm(_zScore) * 100).precision(precision);
}

class _BodyMassIndexForAgeGender {
  _BodyMassIndexForAgeGender({required this.ageData});

  final Map<int, _BodyMassIndexForAgeLMS> ageData;

  @override
  String toString() => 'Gender Data($ageData)';
}

class _BodyMassIndexForAgeLMS {
  _BodyMassIndexForAgeLMS({
    required this.lms,
    required this.loh,
    required this.percentileCutOff,
    required this.standardDeviationCutOff,
  });
  final LMS lms;
  final LengthHeigthMeasurementPosition loh;

  final ZScoreCutOff standardDeviationCutOff;

  final PercentileCutOff percentileCutOff;

  @override
  String toString() =>
      'Age Data(LMS: $lms, Length/Height Measurement Position: $loh, Standard Deviation CutOff: $standardDeviationCutOff, Percentile CutOff: $percentileCutOff)';
}
