// .family<1, 2> 에서 1은 return 받을 type, 2는 파라미터로 보내는 type
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/class/class_list_model.dart';

final getClassListProvider = FutureProvider.autoDispose<List<ClassListModel>>((ref) async {
  final String response = await rootBundle.loadString('assets/data/class_list_data.json');
  var data = json.decode(response);
  var listData = List<ClassListModel>.from(data['listData'].map((data) => ClassListModel.fromJson(data)).toList());

  return listData;
});

final getSiimilarClassListProvider = FutureProvider.autoDispose<List<ClassListModel>>((ref) async {
  final String response = await rootBundle.loadString('assets/data/similar_class_list_data.json');
  var data = json.decode(response);
  var listData = List<ClassListModel>.from(data['listData'].map((data) => ClassListModel.fromJson(data)).toList());

  return listData;
});

final getEndClassListProvider = FutureProvider.autoDispose<List<ClassListModel>>((ref) async {
  final String response = await rootBundle.loadString('assets/data/end_class_list_data.json');
  var data = json.decode(response);
  var listData = List<ClassListModel>.from(data['listData'].map((data) => ClassListModel.fromJson(data)).toList());

  return listData;
});
