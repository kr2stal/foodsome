// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAuthModel _$UserAuthModelFromJson(Map<String, dynamic> json) {
  return _UserAuthModel.fromJson(json);
}

/// @nodoc
mixin _$UserAuthModel {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  CompanyModel get company => throw _privateConstructorUsedError;
  String? get fileNo => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  List<dynamic> get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAuthModelCopyWith<UserAuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthModelCopyWith<$Res> {
  factory $UserAuthModelCopyWith(
          UserAuthModel value, $Res Function(UserAuthModel) then) =
      _$UserAuthModelCopyWithImpl<$Res, UserAuthModel>;
  @useResult
  $Res call(
      {String userId,
      String userName,
      String email,
      CompanyModel company,
      String? fileNo,
      String accessToken,
      String refreshToken,
      List<dynamic> roles});

  $CompanyModelCopyWith<$Res> get company;
}

/// @nodoc
class _$UserAuthModelCopyWithImpl<$Res, $Val extends UserAuthModel>
    implements $UserAuthModelCopyWith<$Res> {
  _$UserAuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
    Object? company = null,
    Object? fileNo = freezed,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? roles = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      fileNo: freezed == fileNo
          ? _value.fileNo
          : fileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyModelCopyWith<$Res> get company {
    return $CompanyModelCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserAuthModelCopyWith<$Res>
    implements $UserAuthModelCopyWith<$Res> {
  factory _$$_UserAuthModelCopyWith(
          _$_UserAuthModel value, $Res Function(_$_UserAuthModel) then) =
      __$$_UserAuthModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String userName,
      String email,
      CompanyModel company,
      String? fileNo,
      String accessToken,
      String refreshToken,
      List<dynamic> roles});

  @override
  $CompanyModelCopyWith<$Res> get company;
}

/// @nodoc
class __$$_UserAuthModelCopyWithImpl<$Res>
    extends _$UserAuthModelCopyWithImpl<$Res, _$_UserAuthModel>
    implements _$$_UserAuthModelCopyWith<$Res> {
  __$$_UserAuthModelCopyWithImpl(
      _$_UserAuthModel _value, $Res Function(_$_UserAuthModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? email = null,
    Object? company = null,
    Object? fileNo = freezed,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? roles = null,
  }) {
    return _then(_$_UserAuthModel(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      fileNo: freezed == fileNo
          ? _value.fileNo
          : fileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAuthModel extends _UserAuthModel {
  _$_UserAuthModel(
      {required this.userId,
      required this.userName,
      required this.email,
      required this.company,
      this.fileNo,
      required this.accessToken,
      required this.refreshToken,
      required final List<dynamic> roles})
      : _roles = roles,
        super._();

  factory _$_UserAuthModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserAuthModelFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String email;
  @override
  final CompanyModel company;
  @override
  final String? fileNo;
  @override
  final String accessToken;
  @override
  final String refreshToken;
  final List<dynamic> _roles;
  @override
  List<dynamic> get roles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  String toString() {
    return 'UserAuthModel(userId: $userId, userName: $userName, email: $email, company: $company, fileNo: $fileNo, accessToken: $accessToken, refreshToken: $refreshToken, roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAuthModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.fileNo, fileNo) || other.fileNo == fileNo) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userName,
      email,
      company,
      fileNo,
      accessToken,
      refreshToken,
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAuthModelCopyWith<_$_UserAuthModel> get copyWith =>
      __$$_UserAuthModelCopyWithImpl<_$_UserAuthModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAuthModelToJson(
      this,
    );
  }
}

abstract class _UserAuthModel extends UserAuthModel {
  factory _UserAuthModel(
      {required final String userId,
      required final String userName,
      required final String email,
      required final CompanyModel company,
      final String? fileNo,
      required final String accessToken,
      required final String refreshToken,
      required final List<dynamic> roles}) = _$_UserAuthModel;
  _UserAuthModel._() : super._();

  factory _UserAuthModel.fromJson(Map<String, dynamic> json) =
      _$_UserAuthModel.fromJson;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get email;
  @override
  CompanyModel get company;
  @override
  String? get fileNo;
  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  List<dynamic> get roles;
  @override
  @JsonKey(ignore: true)
  _$$_UserAuthModelCopyWith<_$_UserAuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}
