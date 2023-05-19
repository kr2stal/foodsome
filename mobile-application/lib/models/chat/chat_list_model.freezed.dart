// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatListModel _$ChatListModelFromJson(Map<String, dynamic> json) {
  return _ChatListModel.fromJson(json);
}

/// @nodoc
mixin _$ChatListModel {
  String? get memberNm => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTime.parse)
  DateTime? get regDt => throw _privateConstructorUsedError;
  String? get readYn => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatListModelCopyWith<ChatListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListModelCopyWith<$Res> {
  factory $ChatListModelCopyWith(
          ChatListModel value, $Res Function(ChatListModel) then) =
      _$ChatListModelCopyWithImpl<$Res, ChatListModel>;
  @useResult
  $Res call(
      {String? memberNm,
      String? summary,
      @JsonKey(fromJson: DateTime.parse) DateTime? regDt,
      String? readYn,
      String? type});
}

/// @nodoc
class _$ChatListModelCopyWithImpl<$Res, $Val extends ChatListModel>
    implements $ChatListModelCopyWith<$Res> {
  _$ChatListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberNm = freezed,
    Object? summary = freezed,
    Object? regDt = freezed,
    Object? readYn = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      memberNm: freezed == memberNm
          ? _value.memberNm
          : memberNm // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      regDt: freezed == regDt
          ? _value.regDt
          : regDt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readYn: freezed == readYn
          ? _value.readYn
          : readYn // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatListModelCopyWith<$Res>
    implements $ChatListModelCopyWith<$Res> {
  factory _$$_ChatListModelCopyWith(
          _$_ChatListModel value, $Res Function(_$_ChatListModel) then) =
      __$$_ChatListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? memberNm,
      String? summary,
      @JsonKey(fromJson: DateTime.parse) DateTime? regDt,
      String? readYn,
      String? type});
}

/// @nodoc
class __$$_ChatListModelCopyWithImpl<$Res>
    extends _$ChatListModelCopyWithImpl<$Res, _$_ChatListModel>
    implements _$$_ChatListModelCopyWith<$Res> {
  __$$_ChatListModelCopyWithImpl(
      _$_ChatListModel _value, $Res Function(_$_ChatListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberNm = freezed,
    Object? summary = freezed,
    Object? regDt = freezed,
    Object? readYn = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_ChatListModel(
      memberNm: freezed == memberNm
          ? _value.memberNm
          : memberNm // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      regDt: freezed == regDt
          ? _value.regDt
          : regDt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      readYn: freezed == readYn
          ? _value.readYn
          : readYn // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatListModel with UtilsForDate implements _ChatListModel {
  _$_ChatListModel(
      {this.memberNm,
      this.summary,
      @JsonKey(fromJson: DateTime.parse) this.regDt,
      this.readYn,
      this.type});

  factory _$_ChatListModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatListModelFromJson(json);

  @override
  final String? memberNm;
  @override
  final String? summary;
  @override
  @JsonKey(fromJson: DateTime.parse)
  final DateTime? regDt;
  @override
  final String? readYn;
  @override
  final String? type;

  @override
  String toString() {
    return 'ChatListModel(memberNm: $memberNm, summary: $summary, regDt: $regDt, readYn: $readYn, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatListModel &&
            (identical(other.memberNm, memberNm) ||
                other.memberNm == memberNm) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.regDt, regDt) || other.regDt == regDt) &&
            (identical(other.readYn, readYn) || other.readYn == readYn) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, memberNm, summary, regDt, readYn, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatListModelCopyWith<_$_ChatListModel> get copyWith =>
      __$$_ChatListModelCopyWithImpl<_$_ChatListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatListModelToJson(
      this,
    );
  }
}

abstract class _ChatListModel implements ChatListModel, UtilsForDate {
  factory _ChatListModel(
      {final String? memberNm,
      final String? summary,
      @JsonKey(fromJson: DateTime.parse) final DateTime? regDt,
      final String? readYn,
      final String? type}) = _$_ChatListModel;

  factory _ChatListModel.fromJson(Map<String, dynamic> json) =
      _$_ChatListModel.fromJson;

  @override
  String? get memberNm;
  @override
  String? get summary;
  @override
  @JsonKey(fromJson: DateTime.parse)
  DateTime? get regDt;
  @override
  String? get readYn;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_ChatListModelCopyWith<_$_ChatListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
