// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) {
  return _CompanyModel.fromJson(json);
}

/// @nodoc
mixin _$CompanyModel {
  String get companyNm => throw _privateConstructorUsedError;
  String get companyCd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyModelCopyWith<CompanyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyModelCopyWith<$Res> {
  factory $CompanyModelCopyWith(
          CompanyModel value, $Res Function(CompanyModel) then) =
      _$CompanyModelCopyWithImpl<$Res, CompanyModel>;
  @useResult
  $Res call({String companyNm, String companyCd});
}

/// @nodoc
class _$CompanyModelCopyWithImpl<$Res, $Val extends CompanyModel>
    implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyNm = null,
    Object? companyCd = null,
  }) {
    return _then(_value.copyWith(
      companyNm: null == companyNm
          ? _value.companyNm
          : companyNm // ignore: cast_nullable_to_non_nullable
              as String,
      companyCd: null == companyCd
          ? _value.companyCd
          : companyCd // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompanyModelCopyWith<$Res>
    implements $CompanyModelCopyWith<$Res> {
  factory _$$_CompanyModelCopyWith(
          _$_CompanyModel value, $Res Function(_$_CompanyModel) then) =
      __$$_CompanyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String companyNm, String companyCd});
}

/// @nodoc
class __$$_CompanyModelCopyWithImpl<$Res>
    extends _$CompanyModelCopyWithImpl<$Res, _$_CompanyModel>
    implements _$$_CompanyModelCopyWith<$Res> {
  __$$_CompanyModelCopyWithImpl(
      _$_CompanyModel _value, $Res Function(_$_CompanyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyNm = null,
    Object? companyCd = null,
  }) {
    return _then(_$_CompanyModel(
      companyNm: null == companyNm
          ? _value.companyNm
          : companyNm // ignore: cast_nullable_to_non_nullable
              as String,
      companyCd: null == companyCd
          ? _value.companyCd
          : companyCd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompanyModel implements _CompanyModel {
  _$_CompanyModel({required this.companyNm, required this.companyCd});

  factory _$_CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyModelFromJson(json);

  @override
  final String companyNm;
  @override
  final String companyCd;

  @override
  String toString() {
    return 'CompanyModel(companyNm: $companyNm, companyCd: $companyCd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompanyModel &&
            (identical(other.companyNm, companyNm) ||
                other.companyNm == companyNm) &&
            (identical(other.companyCd, companyCd) ||
                other.companyCd == companyCd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, companyNm, companyCd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompanyModelCopyWith<_$_CompanyModel> get copyWith =>
      __$$_CompanyModelCopyWithImpl<_$_CompanyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyModelToJson(
      this,
    );
  }
}

abstract class _CompanyModel implements CompanyModel {
  factory _CompanyModel(
      {required final String companyNm,
      required final String companyCd}) = _$_CompanyModel;

  factory _CompanyModel.fromJson(Map<String, dynamic> json) =
      _$_CompanyModel.fromJson;

  @override
  String get companyNm;
  @override
  String get companyCd;
  @override
  @JsonKey(ignore: true)
  _$$_CompanyModelCopyWith<_$_CompanyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
