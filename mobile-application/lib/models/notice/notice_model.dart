import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils.dart';

part 'notice_model.freezed.dart';
part 'notice_model.g.dart';

@freezed
class NoticeModel with _$NoticeModel, UtilsForDate {
  @With<UtilsForDate>()
  factory NoticeModel({
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
    String? memberNm,
    // String? contentStr,
    String? type,
    @JsonKey(fromJson: DateTime.parse) DateTime? regDt,
    @JsonKey(fromJson: dateParser) DateTime? booking,
  }) = _NoticeModel;

  @With<UtilsForDate>()
  factory NoticeModel.fromJson(Map<String, dynamic> json) => _$NoticeModelFromJson(json);
}

DateTime? dateParser(value) {
  if (value != '') {
    return DateTime.parse(value);
  } else {
    return null;
    ;
  }
}
