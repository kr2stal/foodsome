import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/toast_widget.dart';

RegExp emptyRegExp = RegExp(r'\s');
RegExp businessNoRegExp = RegExp(r'^[0-9]{10}$');
RegExp telRegExp = RegExp(r'^[0-9]{8,11}$');

late List<String>? menuNameList;
late List<Widget>? bodyOptions;
List<String> weekdayKo = ['월', '화', '수', '목', '금', '토', '일'];

showNoPageToast(context) => showToast('페이지 준비중입니다.', context);

mixin UtilsForDate {
  /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
  static List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

// DateTime -> yyyy년 mm월 dd일 (요일)
  String dateToString(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    int weekdayOrder = date.weekday - 1;
    String weekday = weekdayKo[weekdayOrder];

    return '$year년 $month월 $day일 ($weekday)';
  }

  // DateTime -> yyyy.mm.dd (요일)
  String dateToStringDot(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    int weekdayOrder = date.weekday - 1;
    String weekday = weekdayKo[weekdayOrder];

    return '$year. $month. $day ($weekday)';
  }

// DateTime -> mm/dd (요일)
  String dateToStringWithoutYear(DateTime date) {
    String month = date.month.toString();
    String day = date.day.toString();
    int weekdayOrder = date.weekday - 1;
    String weekday = weekdayKo[weekdayOrder];

    return '$month/$day ($weekday)';
  }

// DateTime -> mm월 dd일 (요일) 오전 24:00
  String dateToStringWithHours(DateTime date) {
    String month = date.month.toString();
    String day = date.day.toString();
    int weekdayOrder = date.weekday - 1;
    String weekday = weekdayKo[weekdayOrder];
    String hour = date.hour > 12 ? '오후 ${date.hour - 12}' : '오전 ${date.hour}';

    return '$month월 $day일 ($weekday) $hour:${date.minute.toString().padLeft(2, '0')}';
  }

  // DateTime -> yyyysus mm월 dd일 AM 24:00
  String dateToStringWithHoursEn(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    // int weekdayOrder = date.weekday - 1;
    // String weekday = weekdayKo[weekdayOrder];
    String hour = date.hour > 12 ? 'PM ${date.hour - 12}' : 'AM ${date.hour}';

    return '$year년 $month월 $day일 $hour:${date.minute.toString().padLeft(2, '0')}';
  }

// DateTime -> 오전 24:00
  String dateToTime(DateTime date) {
    String hour = date.hour > 12 ? '오후 ${date.hour - 12}' : '오전 ${date.hour}';

    return '$hour:${date.minute.toString().padLeft(2, '0')}';
  }

// DateTime -> yyyyMMdd
  String defaultDateFormatter(DateTime date) {
    return DateFormat("yyyyMMdd").format(date).toString();
  }

// DateTime -> yyyy년 mm월 dd일
  String dateFormatter(DateTime date) {
    String dateStr = DateFormat("yyyyMMdd").format(date).toString();

    return '${dateStr.substring(0, 4)}년 ${dateStr.substring(4, 6)}월 ${dateStr.substring(6, 8)}일';
  }

// String -> mm월 dd일
  String stringToMMdd(String yyyyMMdd) {
    DateTime date = DateTime.parse(yyyyMMdd);

    return '${date.month}월 ${date.day}일';
  }

// DateTime -> yyyy-mm-dd
  String dateSimpleFormatter(DateTime date) {
    String dateStr = DateFormat("yyyyMMddhhmm").format(date).toString();

    return '${dateStr.substring(0, 4)}-${dateStr.substring(4, 6)}-${dateStr.substring(6, 8)}';
  }

// DateTime -> yyyy-mm-dd ~ yyyy-mm-dd
  String dateRangeFormatter(DateTime toDate) {
    DateTime fromDate = DateTime.now();
    String fromDateStr = DateFormat("yyyyMMdd").format(fromDate).toString();
    String toDateStr = DateFormat("yyyyMMdd").format(toDate).toString();

    return '${fromDateStr.substring(0, 4)}-${fromDateStr.substring(4, 6)}-${fromDateStr.substring(6, 8)} ~ ${toDateStr.substring(0, 4)}-${toDateStr.substring(4, 6)}-${toDateStr.substring(6, 8)}';
  }

// String -> hh:mm
  String stringTimeFormatter(String hhmm) {
    return '${hhmm.substring(0, 2)}:${hhmm.substring(2, 4)}';
  }

// DateTime -> hh:mm
  String timeFormatter(DateTime date) {
    String dateStr = DateFormat("yyyyMMddHHmm").format(date).toString();

    return '${dateStr.substring(8, 10)}:${dateStr.substring(10, 12)}';
  }

// String -> mm/dd (요일)
  String stringDateFormatter(String yyyyMMdd) {
    DateTime date = DateTime.parse(yyyyMMdd);

    return dateToStringWithoutYear(date);
  }

// String -> mm/dd
  String simpleDateFormatterWithoutYear(DateTime date) {
    String month = date.month.toString();
    String day = date.day.toString();

    return '$month/$day';
  }

// String -> 02 JAN
  String stringDateEnFormatter(String yyyyMMdd) {
    DateTime date = DateTime.parse(yyyyMMdd);

    return '${NumberFormat("00").format(date.day)} ${DateFormat.MMM('en_US').format(date).toUpperCase()}';
  }

// String -> JAN
  String stringToEnMonth(String yyyyMMdd) {
    DateTime date = DateTime.parse(yyyyMMdd);

    return '${DateFormat.MMM('en_US').format(date).toUpperCase()}';
  }

// DateTime -> JAN
  String dateToEnMonth(DateTime date) {
    return '${DateFormat.MMM('en_US').format(date).toUpperCase()}';
  }

// dd
  String stringToDay(String yyyyMMdd) {
    DateTime date = DateTime.parse(yyyyMMdd);

    return '${NumberFormat("00").format(date.day)}';
  }

// 날짜 비교
  int compareDate(DateTime date1, DateTime date2) {
    // 날짜 같으면 0 반환
    return DateFormat.yMd().format(date1).compareTo(DateFormat.yMd().format(date2));
  }

// 남은 날짜/시간/분 계산기
  String calculateDayDiff(DateTime date) {
    var result = '';

    print(DateTime.now().difference(date).inHours);
    DateTime.now().difference(date).inHours.abs() > 24
        ? result = '${DateTime.now().difference(date).inDays.abs()}일'
        : DateTime.now().difference(date).inMinutes.abs() > 60
            ? result = '${DateTime.now().difference(date).inHours.abs()}시간'
            : result = '${DateTime.now().difference(date).inMinutes.abs()}분';

    return result;
  }

// hh:mm
  String calculateTimeDiff(DateTime startDt, DateTime endDt) {
    Duration diff = startDt.difference(endDt);

    return '${diff.inHours.abs().toString().padLeft(2, '0')}시간 ${(diff.inMinutes - diff.inHours * 60).abs().toString().padLeft(2, '0')}분';
  }

  DateTime? stringToDateTime(String? dateStr) => dateStr != null ? DateTime.parse(dateStr) : null;
}

mixin UtilsForNum {
  String numToString(num number) {
    return number.floor() < number ? '$number' : '${number.truncate()}';
  }

  double stringToDouble(String str) => double.parse(str);
}

mixin UtilsForUser {
  String stringToPhone(String number) {
    return number.replaceAllMapped(RegExp(r'(\d{3})(\d{4})()'), (Match m) => "${m[1]}-${m[2]}-${m[3]}");
  }

  String stringToBirthday(String birth, String type) {
    var date = '${birth.substring(0, 2)}월 ${birth.substring(2, 4)}일생';
    if (type == 'L') date += ' (음력)';
    return date;
  }
}
