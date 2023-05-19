// .family<1, 2> 에서 1은 return 받을 type, 2는 파라미터로 보내는 type
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/chat/chat_list_model.dart';
import '../../models/common_api_result_model.dart';

final getChatListProvider = FutureProvider.autoDispose.family<ApiResultListVO?, Map>((ref, param) async {
  final String response = await rootBundle.loadString('assets/data/chat_list_data.json');
  ApiResultListVO result = ApiResultListVO(status: Status(), extend: [], listData: [], listTotal: '7');
  var data = json.decode(response);
  var listData = List<ChatListModel>.from(data['listData'].map((data) => ChatListModel.fromJson(data)).toList());

  result.listData.clear();
  result.listData.addAll(listData);

  return result;
});

final getNonMemberChatListProvider = FutureProvider.autoDispose.family<ApiResultListVO?, Map>((ref, param) async {
  final String response = await rootBundle.loadString('assets/data/chat_list_data2.json');
  ApiResultListVO result = ApiResultListVO(status: Status(), extend: [], listData: [], listTotal: '3');
  var data = json.decode(response);
  var listData = List<ChatListModel>.from(data['listData'].map((data) => ChatListModel.fromJson(data)).toList());

  result.listData.clear();
  result.listData.addAll(listData);

  return result;
});
