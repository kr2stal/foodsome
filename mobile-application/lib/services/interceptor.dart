import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import '../constants/endpoint.dart';
import '../models/user/user_auth_model.dart';

class AuthorizationInterceptor extends InterceptorContract {
  Box userBox = Hive.box('USER_INFO');

  // request
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      // get token
      String? accessToken = await userBox.get('accessToken') as String?;

      data.headers['Authorization'] = 'Bearer ' + accessToken!;
      data.headers['Content-Type'] = 'application/json';
      data.encoding = Encoding.getByName('utf-8');
    } catch (e) {
      print(e);
    }
    return Future.value(data);
  }

  // response
  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) {
    return Future.value(data);
  }
}

class ExpiredTokenRetryPolicy extends RetryPolicy {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Box userBox = Hive.box('USER_INFO');

  @override
  int maxRetryAttempts = 2;

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401 || response.statusCode == 405) {
      var refreshToken = userBox.get('refreshToken');

      await http
          .post(Uri.parse(Endpoints.BASE_URL + '/api/auth/resignin'),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer $refreshToken',
              },
              encoding: Encoding.getByName("utf-8"),
              body: json.encode({'refreshToken': refreshToken}))
          .catchError((e) {
        // throw e;
      }).then((value) async {
        if (value.statusCode == 200) {
          // 재 로그인 정보가 들어옴
          var reData = jsonDecode(utf8.decode(value.bodyBytes));

          if (reData['status'] == 'success') {
            // get access token
            var user = UserAuthModel.fromJson(reData as Map<String, dynamic>);

            //hive 저장
            Box userBox = Hive.box('USER_INFO');
            await userBox.put('accessToken', user.accessToken);
            await userBox.put('refreshToken', user.refreshToken);

            // return true;
          } else {
            userBox.clear();
            // 로그인 창으로 이동
            Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!, '/login', (route) => false);
          }
          // return true;
        }
      });
      // return true;
    }
    return true;
  }
}
