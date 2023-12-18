// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GrowthReferenceBodyMassIndexMeasurementImpl
    _$$GrowthReferenceBodyMassIndexMeasurementImplFromJson(
            Map<String, dynamic> json) =>
        _$GrowthReferenceBodyMassIndexMeasurementImpl(
          json['value'] as num,
        );

Map<String, dynamic> _$$GrowthReferenceBodyMassIndexMeasurementImplToJson(
        _$GrowthReferenceBodyMassIndexMeasurementImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

_$GrowthReferenceBodyMassIndexForAgeImpl
    _$$GrowthReferenceBodyMassIndexForAgeImplFromJson(
            Map<String, dynamic> json) =>
        _$GrowthReferenceBodyMassIndexForAgeImpl(
          observationDate: json['observationDate'] == null
              ? null
              : Date.fromJson(json['observationDate'] as Map<String, dynamic>),
          sex: $enumDecode(_$SexEnumMap, json['sex']),
          age: Age.fromJson(json['age'] as Map<String, dynamic>),
          bodyMassIndexMeasurement:
              GrowthReferenceBodyMassIndexMeasurement.fromJson(
                  json['bodyMassIndexMeasurement'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$GrowthReferenceBodyMassIndexForAgeImplToJson(
        _$GrowthReferenceBodyMassIndexForAgeImpl instance) =>
    <String, dynamic>{
      'observationDate': instance.observationDate,
      'sex': _$SexEnumMap[instance.sex]!,
      'age': instance.age,
      'bodyMassIndexMeasurement': instance.bodyMassIndexMeasurement,
    };

const _$SexEnumMap = {
  Sex.male: 1,
  Sex.female: 2,
};

_$GrowthReferenceHeightForAgeImpl _$$GrowthReferenceHeightForAgeImplFromJson(
        Map<String, dynamic> json) =>
    _$GrowthReferenceHeightForAgeImpl(
      observationDate: json['observationDate'] == null
          ? null
          : Date.fromJson(json['observationDate'] as Map<String, dynamic>),
      sex: $enumDecode(_$SexEnumMap, json['sex']),
      age: Age.fromJson(json['age'] as Map<String, dynamic>),
      lengthHeight: const LengthConverter()
          .fromJson(json['lengthHeight'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GrowthReferenceHeightForAgeImplToJson(
        _$GrowthReferenceHeightForAgeImpl instance) =>
    <String, dynamic>{
      'observationDate': instance.observationDate,
      'sex': _$SexEnumMap[instance.sex]!,
      'age': instance.age,
      'lengthHeight': const LengthConverter().toJson(instance.lengthHeight),
    };

_$GrowthReferenceWeightForAgeImpl _$$GrowthReferenceWeightForAgeImplFromJson(
        Map<String, dynamic> json) =>
    _$GrowthReferenceWeightForAgeImpl(
      observationDate: json['observationDate'] == null
          ? null
          : Date.fromJson(json['observationDate'] as Map<String, dynamic>),
      sex: $enumDecode(_$SexEnumMap, json['sex']),
      age: Age.fromJson(json['age'] as Map<String, dynamic>),
      weight: const MassConverter()
          .fromJson(json['weight'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GrowthReferenceWeightForAgeImplToJson(
        _$GrowthReferenceWeightForAgeImpl instance) =>
    <String, dynamic>{
      'observationDate': instance.observationDate,
      'sex': _$SexEnumMap[instance.sex]!,
      'age': instance.age,
      'weight': const MassConverter().toJson(instance.weight),
    };