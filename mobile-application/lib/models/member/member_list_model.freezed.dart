// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'member_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberListModel _$MemberListModelFromJson(Map<String, dynamic> json) {
  return _MemberListModel.fromJson(json);
}

/// @nodoc
mixin _$MemberListModel {
  String get classNm => throw _privateConstructorUsedError;
  String get memberNm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberListModelCopyWith<MemberListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberListModelCopyWith<$Res> {
  factory $MemberListModelCopyWith(
          MemberListModel value, $Res Function(MemberListModel) then) =
      _$MemberListModelCopyWithImpl<$Res, MemberListModel>;
  @useResult
  $Res call({String classNm, String memberNm});
}

/// @nodoc
class _$MemberListModelCopyWithImpl<$Res, $Val extends MemberListModel>
    implements $MemberListModelCopyWith<$Res> {
  _$MemberListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classNm = null,
    Object? memberNm = null,
  }) {
    return _then(_value.copyWith(
      classNm: null == classNm
          ? _value.classNm
          : classNm // ignore: cast_nullable_to_non_nullable
              as String,
      memberNm: null == memberNm
          ? _value.memberNm
          : memberNm // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberListModelCopyWith<$Res>
    implements $MemberListModelCopyWith<$Res> {
  factory _$$_MemberListModelCopyWith(
          _$_MemberListModel value, $Res Function(_$_MemberListModel) then) =
      __$$_MemberListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String classNm, String memberNm});
}

/// @nodoc
class __$$_MemberListModelCopyWithImpl<$Res>
    extends _$MemberListModelCopyWithImpl<$Res, _$_MemberListModel>
    implements _$$_MemberListModelCopyWith<$Res> {
  __$$_MemberListModelCopyWithImpl(
      _$_MemberListModel _value, $Res Function(_$_MemberListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classNm = null,
    Object? memberNm = null,
  }) {
    return _then(_$_MemberListModel(
      classNm: null == classNm
          ? _value.classNm
          : classNm // ignore: cast_nullable_to_non_nullable
              as String,
      memberNm: null == memberNm
          ? _value.memberNm
          : memberNm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberListModel implements _MemberListModel {
  _$_MemberListModel({required this.classNm, required this.memberNm});

  factory _$_MemberListModel.fromJson(Map<String, dynamic> json) =>
      _$$_MemberListModelFromJson(json);

  @override
  final String classNm;
  @override
  final String memberNm;

  @override
  String toString() {
    return 'MemberListModel(classNm: $classNm, memberNm: $memberNm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberListModel &&
            (identical(other.classNm, classNm) || other.classNm == classNm) &&
            (identical(other.memberNm, memberNm) ||
                other.memberNm == memberNm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, classNm, memberNm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberListModelCopyWith<_$_MemberListModel> get copyWith =>
      __$$_MemberListModelCopyWithImpl<_$_MemberListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberListModelToJson(
      this,
    );
  }
}

abstract class _MemberListModel implements MemberListModel {
  factory _MemberListModel(
      {required final String classNm,
      required final String memberNm}) = _$_MemberListModel;

  factory _MemberListModel.fromJson(Map<String, dynamic> json) =
      _$_MemberListModel.fromJson;

  @override
  String get classNm;
  @override
  String get memberNm;
  @override
  @JsonKey(ignore: true)
  _$$_MemberListModelCopyWith<_$_MemberListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
