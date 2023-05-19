import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_list_model.freezed.dart';
part 'class_list_model.g.dart';

@freezed
class ClassListModel with _$ClassListModel {
  factory ClassListModel(
      {required String classNm,
      required String type,
      String? location,
      String? exercise,
      String? image,
      String? hashtag,
      int? totalCls,
      int? doneCls,
      String? favorit}) = _ClassListModel;

  factory ClassListModel.fromJson(Map<String, dynamic> json) => _$ClassListModelFromJson(json);
}
