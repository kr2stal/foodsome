import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common_api_result_model.dart';
import '../../models/member/member_list_model.dart';

final getMemberListProvider = FutureProvider.autoDispose.family<ApiResultListVO?, Map>((ref, param) async {
  final String response = await rootBundle.loadString('assets/data/member_list_data.json');
  ApiResultListVO result = ApiResultListVO(status: Status(), extend: [], listData: [], listTotal: '8');
  var data = json.decode(response);
  var listData = List<MemberListModel>.from(data['listData'].map((data) => MemberListModel.fromJson(data)).toList());

  result.listData.clear();
  result.listData.addAll(listData);

  return result;
});
