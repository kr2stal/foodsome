import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_list_model.freezed.dart';
part 'member_list_model.g.dart';

@freezed
class MemberListModel with _$MemberListModel {
  factory MemberListModel({
    required String classNm,
    required String memberNm,
  }) = _MemberListModel;

  factory MemberListModel.fromJson(Map<String, dynamic> json) => _$MemberListModelFromJson(json);
}
