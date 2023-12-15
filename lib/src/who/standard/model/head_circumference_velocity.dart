part of '../standard.dart';

class HeadCircumferenceVelocityForAgeData {
  factory HeadCircumferenceVelocityForAgeData() => _singleton;
  HeadCircumferenceVelocityForAgeData._()
      : _data = (json.decode(_hv) as Map<String, dynamic>).map(
          (k1, v1) => MapEntry(
            k1,
            HeadCircumferenceVelocityForAgeGender(
              incrementData: (v1 as Map<String, dynamic>).map(
                (k2, v2) => MapEntry(
                  k2,
                  HeadCircumferenceVelocityForAgeIncrement(
                    lmsData: (v2 as Map<String, dynamic>).map((k3, v3) {
                      v3 as Map<String, dynamic>;
                      return MapEntry(
                        k3,
                        HeadCircumferenceVelocityForAgeLMS(
                          lms: (l: v3['l'], m: v3['m'], s: v3['s']),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        );

  static final _singleton = HeadCircumferenceVelocityForAgeData._();

  final Map<String, HeadCircumferenceVelocityForAgeGender> _data;
}

class HeadCircumferenceVelocityForAge {
  HeadCircumferenceVelocityForAge({
    required Sex sex,
    required Age age,
    required Map<Date, Length> pastMeasurement,
    required Length lastMeasurementResult,
    required HeadCircumferenceVelocityForAgeData headCircumferenceData,
  })  : _measurementResult = lastMeasurementResult,
        _sex = sex,
        _age = age,
        _pastMeasurement = pastMeasurement,
        _mapGender = headCircumferenceData._data {
    if (!(_age.ageInTotalDaysByNow >= 0 && _age.ageInTotalMonthsByNow <= 24)) {
      throw Exception('Age must be in range of 0 days - 24 months');
    }
    if (_pastMeasurement.isEmpty) {
      throw Exception(
        'Calculation can not be done as past measurment is empty',
      );
    }
    if (_pastMeasurement.keys
        .any((element) => element.isSameAs(Date.today()))) {
      throw Exception(
        'Calculation can not be done as there is todays date in past measurment',
      );
    }
    if (_pastMeasurement.keys.any((element) => element.isAfter(Date.today()))) {
      throw Exception(
        'Calculation can not be done as there is future date in past measurment',
      );
    }
    if (_pastMeasurement.keys
        .any((element) => element.isBefore(_age.dateOfBirth))) {
      throw Exception(
        'Calculation can not be done as there is date less than Date of Birth in past measurement, if you find this exception is a mistake, try to provide exact $Age by using ${Age.byDate} or $Date by using ${Date.fromDateTime} in Past Measurement',
      );
    }
  }

  final Sex _sex;
  final Age _age;
  final Length _measurementResult;
  final Map<Date, Length> _pastMeasurement;
  final Map<String, HeadCircumferenceVelocityForAgeGender> _mapGender;

  HeadCircumferenceVelocityForAgeGender get _maleData => _mapGender['1']!;
  HeadCircumferenceVelocityForAgeGender get _femaleData => _mapGender['2']!;
}

class HeadCircumferenceVelocityForAgeGender {
  HeadCircumferenceVelocityForAgeGender({required this.incrementData});

  final Map<String, HeadCircumferenceVelocityForAgeIncrement> incrementData;
}

class HeadCircumferenceVelocityForAgeIncrement {
  HeadCircumferenceVelocityForAgeIncrement({required this.lmsData});
  final Map<String, HeadCircumferenceVelocityForAgeLMS> lmsData;
}

class HeadCircumferenceVelocityForAgeLMS {
  HeadCircumferenceVelocityForAgeLMS({
    required this.lms,
  });
  final LMS lms;
}

WeeksMonths parseVelocityIncrement(String source) {
  final clean = source.clean.splitSpace.first;
  final splitC = clean.split('-').map(
        (e) => int.tryParse(e) == null
            ? int.parse(
                e.replaceAll(RegExp('[a-zA-z]'), '').replaceAll(' ', ''),
              )
            : int.parse(e),
      );
  if (splitC.length > 2) {
    throw Exception('More than 2 element');
  }
  if (source.contains('wks')) {
    if (source.contains('mo')) {
      return (
        weeks: null,
        weeksMonths: (low: splitC.first, high: splitC.last),
        months: null,
      );
    }
    return (
      weeks: (low: splitC.first, high: splitC.last),
      weeksMonths: null,
      months: null,
    );
  } else {
    return (
      weeks: null,
      weeksMonths: null,
      months: (low: splitC.first, high: splitC.last)
    );
  }
}
