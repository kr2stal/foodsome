import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
class CompanyModel with _$CompanyModel {
  factory CompanyModel({
    required String companyNm,
    required String companyCd,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);
}
