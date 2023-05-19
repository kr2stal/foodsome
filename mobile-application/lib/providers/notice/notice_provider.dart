import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common_api_result_model.dart';
import '../../models/notice/notice_model.dart';
import '../../services/common_service.dart';

// .family<1, 2> 에서 1은 return 받을 type, 2는 파라미터로 보내는 type
final getNoticeListProvider = FutureProvider.autoDispose.family<ApiResultListVO?, Map>((ref, param) async {
  // var result = await ref.read(commonService).getListDataApi(url: '/getNoticeList', param: {
  //   'company_cd': param['companyCd'],
  //   'member_id': param['memberId'],
  //   'page_row_num': param['pageRowNum'],
  //   'page': param['page'],
  // });
  final String response = await rootBundle.loadString('assets/data/notice_list_data.json');
  ApiResultListVO result = ApiResultListVO(status: Status(), extend: [], listData: [], listTotal: '18');
  var data = json.decode(response);
  var listData = List<NoticeModel>.from(data['listData'].map((data) => NoticeModel.fromJson(data)).toList());

  result.listData.clear();
  result.listData.addAll(listData);

  return result;
});

final noticeFilterNotifyProvider = StateNotifierProvider<NoticeFilterNotifier, int>((ref) => NoticeFilterNotifier());

class NoticeFilterNotifier extends StateNotifier<int> {
  NoticeFilterNotifier() : super(0);

  setSelectedIdx(index) {
    return state = index;
  }

  refresh() => state = 0;
}
