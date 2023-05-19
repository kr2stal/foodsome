import 'package:freezed_annotation/freezed_annotation.dart';

import 'company_model.dart';

part 'user_auth_model.freezed.dart';
part 'user_auth_model.g.dart';

@freezed
class UserAuthModel with _$UserAuthModel {
  const UserAuthModel._();

  factory UserAuthModel({
    required String userId,
    required String userName,
    required String email,
    required CompanyModel company,
    String? fileNo,
    required String accessToken,
    required String refreshToken,
    required List<dynamic> roles,
  }) = _UserAuthModel;

  factory UserAuthModel.fromJson(Map<String, dynamic> json) => _$UserAuthModelFromJson(json);
}
