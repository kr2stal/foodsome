import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import '../constants/endpoint.dart';
import '../models/common_api_result_model.dart';
import 'interceptor.dart';
import 'network_exceptions.dart';

class CommonService {
  CommonService({this.reader});
  final Reader? reader;

  final client = InterceptedClient.build(
    interceptors: [
      AuthorizationInterceptor(),
    ],
    retryPolicy: ExpiredTokenRetryPolicy(),
  );

  Future<ApiResultListVO?> getListDataApi({required String url, required Map param}) async {
    final response = await client
        .post(
      Uri.parse('${Endpoints.BASE_URL}$url'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(param),
    )
        .catchError((e) {
      // throw e;
    });
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return ApiResultListVO.fromJson(data);

        // if (data['status'] == 'fail') {
        //   print('=====================fail ');
        //   return ApiResultListVO.fromJson(data);
        // } else {
        //   return ApiResultListVO.fromJson(data);
        // }
      } else {
        throw NetworkException(message: 'Error in getUserData(URL)', statusCode: 999);
      }
    } catch (e) {
      throw (e);
    }
  }
}

//API SERVICE Provider
final Provider<CommonService> commonService = Provider<CommonService>((ProviderRef<CommonService> ref) => CommonService());
