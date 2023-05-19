// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) {
  return _NoticeModel.fromJson(json);
}

/// @nodoc
mixin _$NoticeModel {
// required String companyCd,
// required String memberId,
// String? memberNm,
// required String noticeNo,
// required String title,
// @Default('') String content,
// String? contentTp,
// String? viewedSt,
// String? fileNo,
// String? regUserId,
// @JsonKey(fromJson: DateTime.parse) DateTime? regDt,
// String? contentStr,
  String? get memberNm =>
      throw _privateConstructorUsedError; // String? contentStr,
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTime.parse)
  DateTime? get regDt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateParser)
  DateTime? get booking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoticeModelCopyWith<NoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeModelCopyWith<$Res> {
  factory $NoticeModelCopyWith(
          NoticeModel value, $Res Function(NoticeModel) then) =
      _$NoticeModelCopyWithImpl<$Res, NoticeModel>;
  @useResult
  $Res call(
      {String? memberNm,
      String? type,
      @JsonKey(fromJson: DateTime.parse) DateTime? regDt,
      @JsonKey(fromJson: dateParser) DateTime? booking});
}

/// @nodoc
class _$NoticeModelCopyWithImpl<$Res, $Val extends NoticeModel>
    implements $NoticeModelCopyWith<$Res> {
  _$NoticeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberNm = freezed,
    Object? type = freezed,
    Object? regDt = freezed,
    Object? booking = freezed,
  }) {
    return _then(_value.copyWith(
      memberNm: freezed == memberNm
          ? _value.memberNm
          : memberNm // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      regDt: freezed == regDt
          ? _value.regDt
          : regDt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      booking: freezed == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoticeModelCopyWith<$Res>
    implements $NoticeModelCopyWith<$Res> {
  factory _$$_NoticeModelCopyWith(
          _$_NoticeModel value, $Res Function(_$_NoticeModel) then) =
      __$$_NoticeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? memberNm,
      String? type,
      @JsonKey(fromJson: DateTime.parse) DateTime? regDt,
      @JsonKey(fromJson: dateParser) DateTime? booking});
}

/// @nodoc
class __$$_NoticeModelCopyWithImpl<$Res>
    extends _$NoticeModelCopyWithImpl<$Res, _$_NoticeModel>
    implements _$$_NoticeModelCopyWith<$Res> {
  __$$_NoticeModelCopyWithImpl(
      _$_NoticeModel _value, $Res Function(_$_NoticeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberNm = freezed,
    Object? type = freezed,
    Object? regDt = freezed,
    Object? booking = freezed,
  }) {
    return _then(_$_NoticeModel(
      memberNm: freezed == memberNm
          ? _value.memberNm
          : memberNm // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      regDt: freezed == regDt
          ? _value.regDt
          : regDt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      booking: freezed == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NoticeModel with UtilsForDate implements _NoticeModel {
  _$_NoticeModel(
      {this.memberNm,
      this.type,
      @JsonKey(fromJson: DateTime.parse) this.regDt,
      @JsonKey(fromJson: dateParser) this.booking});

  factory _$_NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$$_NoticeModelFromJson(json);

// required String companyCd,
// required String memberId,
// String? memberNm,
// required String noticeNo,
// required String title,
// @Default('') String content,
// String? contentTp,
// String? viewedSt,
// String? fileNo,
// String? regUserId,
// @JsonKey(fromJson: DateTime.parse) DateTime? regDt,
// String? contentStr,
  @override
  final String? memberNm;
// String? contentStr,
  @override
  final String? type;
  @override
  @JsonKey(fromJson: DateTime.parse)
  final DateTime? regDt;
  @override
  @JsonKey(fromJson: dateParser)
  final DateTime? booking;

  @override
  String toString() {
    return 'NoticeModel(memberNm: $memberNm, type: $type, regDt: $regDt, booking: $booking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoticeModel &&
            (identical(other.memberNm, memberNm) ||
                other.memberNm == memberNm) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.regDt, regDt) || other.regDt == regDt) &&
            (identical(other.booking, booking) || other.booking == booking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, memberNm, type, regDt, booking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoticeModelCopyWith<_$_NoticeModel> get copyWith =>
      __$$_NoticeModelCopyWithImpl<_$_NoticeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoticeModelToJson(
      this,
    );
  }
}

abstract class _NoticeModel implements NoticeModel, UtilsForDate {
  factory _NoticeModel(
      {final String? memberNm,
      final String? type,
      @JsonKey(fromJson: DateTime.parse) final DateTime? regDt,
      @JsonKey(fromJson: dateParser) final DateTime? booking}) = _$_NoticeModel;

  factory _NoticeModel.fromJson(Map<String, dynamic> json) =
      _$_NoticeModel.fromJson;

  @override // required String companyCd,
// required String memberId,
// String? memberNm,
// required String noticeNo,
// required String title,
// @Default('') String content,
// String? contentTp,
// String? viewedSt,
// String? fileNo,
// String? regUserId,
// @JsonKey(fromJson: DateTime.parse) DateTime? regDt,
// String? contentStr,
  String? get memberNm;
  @override // String? contentStr,
  String? get type;
  @override
  @JsonKey(fromJson: DateTime.parse)
  DateTime? get regDt;
  @override
  @JsonKey(fromJson: dateParser)
  DateTime? get booking;
  @override
  @JsonKey(ignore: true)
  _$$_NoticeModelCopyWith<_$_NoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
