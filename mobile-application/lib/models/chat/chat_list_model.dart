import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils.dart';

part 'chat_list_model.freezed.dart';
part 'chat_list_model.g.dart';

@freezed
class ChatListModel with _$ChatListModel, UtilsForDate {
  @With<UtilsForDate>()
  factory ChatListModel({
    String? memberNm,
    String? summary,
    @JsonKey(fromJson: DateTime.parse) DateTime? regDt,
    String? readYn,
    String? type,
  }) = _ChatListModel;

  @With<UtilsForDate>()
  factory ChatListModel.fromJson(Map<String, dynamic> json) => _$ChatListModelFromJson(json);
}
