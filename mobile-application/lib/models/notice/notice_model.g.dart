// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoticeModel _$$_NoticeModelFromJson(Map<String, dynamic> json) =>
    _$_NoticeModel(
      memberNm: json['memberNm'] as String?,
      type: json['type'] as String?,
      regDt: DateTime.parse(json['regDt'] as String),
      booking: dateParser(json['booking']),
    );

Map<String, dynamic> _$$_NoticeModelToJson(_$_NoticeModel instance) =>
    <String, dynamic>{
      'memberNm': instance.memberNm,
      'type': instance.type,
      'regDt': instance.regDt?.toIso8601String(),
      'booking': instance.booking?.toIso8601String(),
    };
