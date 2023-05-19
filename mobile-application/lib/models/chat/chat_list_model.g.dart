// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatListModel _$$_ChatListModelFromJson(Map<String, dynamic> json) =>
    _$_ChatListModel(
      memberNm: json['memberNm'] as String?,
      summary: json['summary'] as String?,
      regDt: DateTime.parse(json['regDt'] as String),
      readYn: json['readYn'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_ChatListModelToJson(_$_ChatListModel instance) =>
    <String, dynamic>{
      'memberNm': instance.memberNm,
      'summary': instance.summary,
      'regDt': instance.regDt?.toIso8601String(),
      'readYn': instance.readYn,
      'type': instance.type,
    };
