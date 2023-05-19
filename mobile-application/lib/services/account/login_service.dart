import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../constants/endpoint.dart';
import '../../models/user/user_auth_model.dart';
import '../network_exceptions.dart';

class LoginService {
  // final client = InterceptedClient.build(
  //   interceptors: [
  //     AuthorizationInterceptor(),
  //   ],
  //   retryPolicy: ExpiredTokenRetryPolicy(),
  // );

  Future<String>? getLoginResult({required Map param}) async {
    final response = await http
        .post(Uri.parse('${Endpoints.BASE_URL}/api/auth/signin'), headers: {'Content-Type': 'application/json'}, body: json.encode(param))
        .catchError((e) {
      // throw e;
    });
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        // print('getLoginResult data ===>>> $data');

        if (data['status'] == 'fail') {
          return 'fail';
        } else {
          var user = UserAuthModel.fromJson(data as Map<String, dynamic>);

          //hive 저장
          Box userBox = Hive.box('USER_INFO');
          await userBox.put('accessToken', user.accessToken);
          await userBox.put('refreshToken', user.refreshToken);
          await userBox.put('userName', user.userName);
          await userBox.put('userId', user.userId);
          await userBox.put('companyCd', user.company.companyCd);
          await userBox.put('email', user.email);
          await userBox.put('isLoggedIn', true);

          return 'success';
        }
      } else {
        throw NetworkException(message: 'Error in getLoginResult', statusCode: 999);
      }
    } catch (e) {
      throw (e);
    }
  }
}

//API SERVICE Provider
final Provider<LoginService> loginService = Provider<LoginService>((ProviderRef<LoginService> ref) => LoginService());
