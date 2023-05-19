// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClassListModel _$$_ClassListModelFromJson(Map<String, dynamic> json) =>
    _$_ClassListModel(
      classNm: json['classNm'] as String,
      type: json['type'] as String,
      location: json['location'] as String?,
      exercise: json['exercise'] as String?,
      image: json['image'] as String?,
      hashtag: json['hashtag'] as String?,
      totalCls: json['totalCls'] as int?,
      doneCls: json['doneCls'] as int?,
      favorit: json['favorit'] as String?,
    );

Map<String, dynamic> _$$_ClassListModelToJson(_$_ClassListModel instance) =>
    <String, dynamic>{
      'classNm': instance.classNm,
      'type': instance.type,
      'location': instance.location,
      'exercise': instance.exercise,
      'image': instance.image,
      'hashtag': instance.hashtag,
      'totalCls': instance.totalCls,
      'doneCls': instance.doneCls,
      'favorit': instance.favorit,
    };
