class Status {
  Status({this.result = '', this.resultCode = '', this.message = ''});
  String result = '';
  String resultCode = '';
  String message = '';

  Status.fromJson(Map<String, dynamic> json) {
    result = json['result'] as String;
    resultCode = json['resultCode'] as String;
    message = json['message'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> reData = Map<String, dynamic>();
    reData['result'] = result;
    reData['resultCode'] = resultCode;
    reData['message'] = message;
    return reData;
  }
}

class ApiResultVO {
  ApiResultVO({
    required this.status,
    required this.extend,
    required this.data,
  });

  Status status = Status();
  List<dynamic> extend = List<dynamic>.empty(growable: true);
  List<dynamic> data = List<dynamic>.empty(growable: true);

  ApiResultVO.fromJson(Map<String, dynamic> json) {
    status = (json['status'] != null ? Status.fromJson(json['status'] as Map<String, dynamic>) : null)!;

    if (json['extend'] != null) {
      extend = List<dynamic>.empty(growable: true);
      json['extend'].forEach((v) {
        extend.add(v);
      });
    }

    if (json['data'] != null) {
      data = List<dynamic>.empty(growable: true);
      json['data'].forEach((v) {
        data.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status.toJson();
    data['extend'] = extend.map((v) => v).toList();
    data['data'] = this.data.map((v) => v).toList();
    return data;
  }
}

class ApiResultListVO {
  ApiResultListVO({
    required this.status,
    required this.extend,
    required this.listData,
    required this.listTotal,
  });

  Status status = Status();
  String listTotal = '0';
  List<dynamic> extend = List<dynamic>.empty(growable: true);
  List<dynamic> listData = List<dynamic>.empty(growable: true);

  ApiResultListVO.fromJson(Map<String, dynamic> json) {
    status = (json['status'] != null ? Status.fromJson(json['status'] as Map<String, dynamic>) : null)!;
    listTotal = (json['listTotal'] ?? '0')! as String;

    if (json['extend'] != null) {
      extend = List<dynamic>.empty(growable: true);
      json['extend'].forEach((v) {
        extend.add(v);
      });
    }

    if (json['listData'] != null) {
      listData = List<dynamic>.empty(growable: true);
      json['listData'].forEach((v) {
        listData.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> reData = Map<String, dynamic>();
    reData['status'] = status.toJson();
    reData['extend'] = extend.map((v) => v).toList();
    reData['listData'] = listData.map((v) => v).toList();
    reData['listTotal'] = listTotal;
    return reData;
  }
}
