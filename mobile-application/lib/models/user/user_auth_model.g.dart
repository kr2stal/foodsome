// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAuthModel _$$_UserAuthModelFromJson(Map<String, dynamic> json) =>
    _$_UserAuthModel(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      fileNo: json['fileNo'] as String?,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      roles: json['roles'] as List<dynamic>,
    );

Map<String, dynamic> _$$_UserAuthModelToJson(_$_UserAuthModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'company': instance.company,
      'fileNo': instance.fileNo,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'roles': instance.roles,
    };
