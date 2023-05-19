// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants/holiday.dart';
import '../../providers/theme_provider.dart';
import '../../stores/timer_store.dart';
import '../class/class_create_screen.dart';
import '../class/profile/trainer_profile_setting.dart';

class TrainerHomeScreen extends StatefulWidget {
  const TrainerHomeScreen({Key? key}) : super(key: key);

  @override
  State<TrainerHomeScreen> createState() => _TrainerHomeScreenState();
}

class _TrainerHomeScreenState extends State<TrainerHomeScreen> {
  late ValueNotifier<List<Event>> _selectedEvents2;
  ValueNotifier<DateTime> _now = ValueNotifier<DateTime>(DateTime.now());

  bool checkP = true, checkG = true;

  bool isPChecked = true;
  bool isGChecked = true;
  late bool isfirst;
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  DateTime? liveTime = DateTime.now();

  int todaySchedule = 0;

  Map<DateTime, List<Event>> events = {
    DateTime.utc(2022, 10, 27): [Event('워크샵1')],
    DateTime.utc(2022, 10, 28): [Event('워크샵2')],
    DateTime.utc(2022, 11, 1): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 2): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 3): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 4): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 7): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 8): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 9): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 10): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 11): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 14): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 15): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 16): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 17): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(2022, 11, 18): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
    DateTime.utc(int.parse(DateFormat.y().format(DateTime.now())), int.parse(DateFormat.M().format(DateTime.now())),
        int.parse(DateFormat.d().format(DateTime.now()))): [
      Event('최바람 회원님과의 클래스'),
      Event('금요일 오전 10시 그룹 클래스'),
      Event('복지수 회원님과의 클래스'),
      Event('금요 직장인 반'),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event('박치원 회원님과의 클래스')
    ],
  };

  Map<DateTime, List<Event>> listEvents = {
    DateTime.utc(2022, 10, 27): [Event(''), Event(''), Event('워크샵 첫째날')],
    DateTime.utc(2022, 10, 28): [Event(''), Event(''), Event('워크샵 둘째날')],
    DateTime.utc(2022, 11, 1): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 2): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 3): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 4): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 7): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 8): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 9): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 10): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 11): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 14): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 15): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 16): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 17): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(2022, 11, 18): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
    DateTime.utc(int.parse(DateFormat.y().format(DateTime.now())), int.parse(DateFormat.M().format(DateTime.now())),
        int.parse(DateFormat.d().format(DateTime.now()))): [
      Event('최바람 회원님과의 클래스'),
      Event(''),
      Event('금요일 오전 10시 그룹 클래스'),
      Event(''),
      Event(''),
      Event('복지수 회원님과의 클래스'),
      Event(''),
      Event(''),
      Event('금요 직장인 반'),
      Event(''),
      Event('최바람 회원님과의 클래스'),
      Event('박현승 회원님과의 클래스'),
      Event(''),
      Event('박치원 회원님과의 클래스'),
      Event(''),
      Event('')
    ],
  };

  List Date1 = [];

  List dow = ['', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  List<Color> colors = [
    Colors.white,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.black
  ];

  late final DateTime now1;

  List<Event> _getEventsForDay(DateTime day) {
    return listEvents[day] ?? [];
  }

  List<Event> _getEventsForDay2(DateTime day) {
    return events[day] ?? [];
  }

  CalendarFormat format = CalendarFormat.month;

  @override
  void initState() {
    Date1.addAll(listEvents.keys);
    _selectedDay = _focusedDay;
    _selectedEvents2 = ValueNotifier(_getEventsForDay(_selectedDay!));
    now1 = DateTime.now();
    todaySchedule = events[DateTime.utc(int.parse(DateFormat.y().format(DateTime.now())), int.parse(DateFormat.M().format(DateTime.now())),
            int.parse(DateFormat.d().format(DateTime.now())))]!
        .length;
    isfirst = true;
    super.initState();
  }

  @override
  void dispose() {
    _selectedEvents2.dispose();
    super.dispose();
  }

  // void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
  //   if (!isSameDay(_selectedDay, selectedDay)) {
  //     setState(() {
  //       _focusedDay = focusedDay;
  //       _selectedDay = selectedDay;
  //       eventselectedDay = selectedDay;
  //       eventDay = selectedDay;

  //       _selectedEvents2.value = _getEventsForDay(_focusedDay);
  //       _selectedEvents.value = _getEventsForDay2(_focusedDay);
  //     });
  //   }
  // }

  classTypeFilter() {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Row(
        children: [
          Checkbox(
            value: checkP,
            splashRadius: 10,
            visualDensity: VisualDensity.compact,
            fillColor: MaterialStateProperty.all(PRIMARY_COLOR),
            onChanged: (bool? newValue) {
              setState(() {
                checkP = newValue!;
              });
            },
          ),
          Text(
            'P',
            style: TextStyle(fontWeight: FontWeight.bold, color: PRIMARY_COLOR, fontSize: ScreenUtil().setSp(20)),
          )
        ],
      ),
      Row(
        children: [
          Checkbox(
            value: checkG,
            splashRadius: 10,
            visualDensity: VisualDensity.compact,
            fillColor: MaterialStateProperty.all(PRIMARY_COLOR),
            onChanged: (bool? newValue) {
              setState(() {
                checkG = newValue!;
              });
            },
          ),
          Text(
            'G',
            style: TextStyle(fontWeight: FontWeight.bold, color: PRIMARY_COLOR, fontSize: ScreenUtil().setSp(20)),
          )
        ],
      ),
    ]);
  }

  // Widget buildEventsMarker(DateTime date, Map<DateTime, List<Event>> events) {
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 300),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
  //       color: Color.fromRGBO(126, 141, 254, 1),
  //       // boxShadow: [BoxShadow(blurRadius: 6.0, color: Color(0xff29000000), offset: Offset(0.0, 3.0))]
  //     ),
  //     // width: 16.0,
  //     width: ScreenUtil().setWidth(35),
  //     height: ScreenUtil().setHeight(16.0),
  //     child: Center(
  //       // 이벤트 개수로 표기
  //       child: Text(
  //         '${_selectedEvents.value.length}',
  //         style: TextStyle().copyWith(
  //           color: Colors.white,
  //           fontSize: ScreenUtil().setSp(14),
  //           fontWeight: FontWeight.bold
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Color.fromRGBO(75, 60, 247, 1);
    }

    List holidays = [];
    HOLIDAY.map((map) {
      var year = int.parse(map['year']);
      List holidayList = map['holiday'].map((holidayMap) => DateTime(year, int.parse(holidayMap['month']), int.parse(holidayMap['day']))).toList();

      holidays.addAll(holidayList);
    }).toList();
    return SafeArea(
      // color: Colors.white,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(28),
                    ),
                    Text(DateFormat.MMMMEEEEd('ko-KR').format(_focusedDay),
                        style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Text('오늘, ${todaySchedule}건의 스케줄이\n있습니다.', style: TextStyle(fontSize: ScreenUtil().setSp(25), fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: ScreenUtil().setHeight(28),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: Color.fromRGBO(241, 244, 253, 1),
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8), vertical: ScreenUtil().setHeight(14)),
                                child: Stack(
                                  children: [
                                    TableCalendar<Event>(
                                        focusedDay: _focusedDay,
                                        firstDay: DateTime.utc(2022, 1, 1),
                                        lastDay: DateTime.utc(2025, 12, 31),
                                        startingDayOfWeek: StartingDayOfWeek.monday,
                                        calendarFormat: format,
                                        onPageChanged: (focusedDay) {
                                          _focusedDay = focusedDay;
                                        },
                                        locale: 'en-US',
                                        headerStyle: HeaderStyle(
                                          titleTextFormatter: (date, locale) => DateFormat.y(locale).add_M().format(date),
                                          titleTextStyle: TextStyle(fontSize: ScreenUtil().setSp(22), fontWeight: FontWeight.bold),
                                          leftChevronVisible: false,
                                          rightChevronVisible: false,
                                          formatButtonVisible: false,
                                          headerMargin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(8), ScreenUtil().setHeight(0),
                                              ScreenUtil().setWidth(0), ScreenUtil().setHeight(8)),
                                        ),
                                        onDaySelected: (selectedDay, focusedDay) {
                                          setState(() {
                                            _focusedDay = focusedDay;
                                            _selectedDay = selectedDay;
                                            _selectedEvents2 = ValueNotifier(_getEventsForDay(_selectedDay!));
                                            todaySchedule = _getEventsForDay2(_focusedDay).length;
                                            isfirst = false;
                                            _selectedEvents2.value = _getEventsForDay(_focusedDay);
                                          });
                                        },
                                        holidayPredicate: (day) => holidays.contains(DateTime(day.year, day.month, day.day)),
                                        selectedDayPredicate: (day) => isSameDay(_focusedDay, day),
                                        weekendDays: [DateTime.sunday],
                                        calendarStyle: CalendarStyle(
                                          cellAlignment: Alignment.center,
                                          markerSize: 5.0,
                                          markersMaxCount: 1,
                                          markerDecoration: BoxDecoration(
                                            color: Color.fromRGBO(102, 122, 254, 1),
                                            shape: BoxShape.circle,
                                          ),
                                          defaultDecoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          todayDecoration: BoxDecoration(
                                            color: Color.fromRGBO(75, 60, 247, 1),
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          selectedDecoration: BoxDecoration(
                                            color: Color.fromRGBO(188, 196, 255, 1),
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          holidayDecoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(5)),
                                          weekendDecoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(5)),
                                          selectedTextStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          todayTextStyle:
                                              TextStyle(fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.bold, color: Colors.white),
                                          defaultTextStyle:
                                              TextStyle(fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.bold, color: Colors.black),
                                          weekendTextStyle:
                                              TextStyle(fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.bold, color: Colors.red),
                                          holidayTextStyle:
                                              TextStyle(fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.bold, color: Colors.red),
                                          outsideDaysVisible: false,
                                        ),
                                        eventLoader: _getEventsForDay,
                                        calendarBuilders: CalendarBuilders(
                                          // singleMarkerBuilder: (context, date, _) {
                                          //   Widget? children;
                                          //   if (date == eventselectedDay) {
                                          //     children = Positioned(
                                          //       child: buildEventsMarker(date, events),
                                          //     );
                                          //   }
                                          //   return children;
                                          // },
                                          dowBuilder: (context, day) {
                                            switch (day.weekday) {
                                              case 7:
                                                return Center(
                                                  child: Text('Sun', style: TextStyle(color: Colors.red, fontSize: ScreenUtil().setSp(12))),
                                                );
                                              default:
                                                return Center(
                                                  child: Text('${dow[day.weekday]}', style: TextStyle(fontSize: ScreenUtil().setSp(12))),
                                                );
                                            }
                                          },
                                        )),
                                  ],
                                ))),
                        SizedBox(height: ScreenUtil().setHeight(31)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
                              child: Row(
                                children: [
                                  Text('TIME',
                                      style: TextStyle(
                                          color: Color.fromRGBO(75, 60, 247, 1), fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(18))),
                                  SizedBox(width: ScreenUtil().setWidth(19)),
                                  Text('SCHEDULE',
                                      style: TextStyle(
                                          color: Color.fromRGBO(75, 60, 247, 1), fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(18))),
                                  SizedBox(width: ScreenUtil().setWidth(70)),
                                  classTypeFilter()
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(24)),
                        Container(
                          padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
                          child: ValueListenableBuilder<List<Event>>(
                            valueListenable: _selectedEvents2,
                            builder: (context, value, _) {
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 16,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ValueListenableBuilder(
                                          valueListenable: _now,
                                          builder: (context, now, child) {
                                            return Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                if (int.parse(DateFormat.d().format(_selectedDay!)) ==
                                                        int.parse(DateFormat.d().format(DateTime.now())) &&
                                                    index + 8 == int.parse(DateFormat.H().format(DateTime.now())))
                                                  index + 8 < 10
                                                      ? Text('0${index + 8}:00',
                                                          style: TextStyle(
                                                              color: Color.fromRGBO(75, 60, 247, 1),
                                                              fontSize: ScreenUtil().setSp(15),
                                                              fontWeight: FontWeight.bold))
                                                      : Text('${index + 8}:00',
                                                          style: TextStyle(
                                                              color: Color.fromRGBO(75, 60, 247, 1),
                                                              fontSize: ScreenUtil().setSp(15),
                                                              fontWeight: FontWeight.bold))
                                                else
                                                  index + 8 < 10
                                                      ? Text('0${index + 8}:00',
                                                          style: TextStyle(color: Color.fromRGBO(124, 124, 124, 1), fontSize: ScreenUtil().setSp(15)))
                                                      : Text('${index + 8}:00',
                                                          style:
                                                              TextStyle(color: Color.fromRGBO(124, 124, 124, 1), fontSize: ScreenUtil().setSp(15))),
                                                Column(
                                                          children: [
                                                            SizedBox(height: ScreenUtil().setHeight(8)),
                                                            if (int.parse(DateFormat.d().format(_selectedDay!)) ==
                                                                    int.parse(DateFormat.d().format(DateTime.now())) &&
                                                                index + 8 == int.parse(DateFormat.H().format(liveTime!)))
                                                              Container(
                                                                  child: Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                          height: ScreenUtil().setHeight(2),
                                                                          color: Color.fromRGBO(75, 60, 247, 1),
                                                                          width: ScreenUtil().setWidth(280)),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: ScreenUtil().setHeight(7))
                                                                ],
                                                              )),
                                                            if (index < value.length)
                                                              value[index].title != ''
                                                                  ? Container(
                                                                      child: InkWell(
                                                                        onTap: () => print('${int.parse(DateFormat.H().format(DateTime.now()))}'),
                                                                        child: Card(
                                                                            elevation: 0,
                                                                            child: Column(
                                                                              children: [
                                                                                if (int.parse(DateFormat.d().format(_selectedDay!)) >
                                                                                    int.parse(DateFormat.d().format(now1)))
                                                                                  Container(
                                                                                      width: ScreenUtil().setWidth(280),
                                                                                      decoration: BoxDecoration(
                                                                                          color: colors[index].withOpacity(0.07),
                                                                                          borderRadius: BorderRadius.circular(10)),
                                                                                      child: Padding(
                                                                                          padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                                                                                          child: Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.perm_identity,
                                                                                                size: ScreenUtil().setSp(20),
                                                                                              ),
                                                                                              SizedBox(width: ScreenUtil().setWidth(10)),
                                                                                              Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text('${value[index]}',
                                                                                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                                                                                  SizedBox(height: ScreenUtil().setHeight(8)),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Icon(Icons.watch_later_outlined,
                                                                                                          size: ScreenUtil().setSp(16),
                                                                                                          color: Color.fromRGBO(124, 124, 124, 1)),
                                                                                                      SizedBox(width: ScreenUtil().setWidth(5)),
                                                                                                      Text('${index + 8}:00 - ${index + 9}:00',
                                                                                                          style: TextStyle(
                                                                                                              color:
                                                                                                                  Color.fromRGBO(124, 124, 124, 1))),
                                                                                                    ],
                                                                                                  ),
                                                                                                  SizedBox(height: ScreenUtil().setHeight(8)),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Icon(Icons.where_to_vote_outlined,
                                                                                                          size: ScreenUtil().setSp(16),
                                                                                                          color: Color.fromRGBO(124, 124, 124, 1)),
                                                                                                      SizedBox(width: ScreenUtil().setWidth(5)),
                                                                                                      Text('KingGYM',
                                                                                                          style: TextStyle(
                                                                                                              color:
                                                                                                                  Color.fromRGBO(124, 124, 124, 1))),
                                                                                                    ],
                                                                                                  )
                                                                                                ],
                                                                                              )
                                                                                            ],
                                                                                          )))
                                                                                else if (int.parse(DateFormat.d().format(_selectedDay!)) ==
                                                                                    int.parse(DateFormat.d().format(DateTime.now())))
                                                                                  Container(
                                                                                      width: ScreenUtil().setWidth(280),
                                                                                      decoration: BoxDecoration(
                                                                                          color: index + 8 >=
                                                                                                  int.parse(DateFormat.H().format(DateTime.now()))
                                                                                              ? colors[index].withOpacity(0.07)
                                                                                              : Color.fromRGBO(244, 244, 244, 1),
                                                                                          borderRadius: BorderRadius.circular(10)),
                                                                                      child: Padding(
                                                                                          padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                                                                                          child: Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.perm_identity,
                                                                                                size: ScreenUtil().setSp(20),
                                                                                              ),
                                                                                              SizedBox(width: ScreenUtil().setWidth(10)),
                                                                                              Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text('${value[index]}',
                                                                                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                                                                                  SizedBox(height: ScreenUtil().setHeight(8)),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Icon(Icons.watch_later_outlined,
                                                                                                          size: ScreenUtil().setSp(16),
                                                                                                          color: Color.fromRGBO(124, 124, 124, 1)),
                                                                                                      SizedBox(width: ScreenUtil().setWidth(5)),
                                                                                                      Text('${index + 8}:00 - ${index + 9}:00',
                                                                                                          style: TextStyle(
                                                                                                              color:
                                                                                                                  Color.fromRGBO(124, 124, 124, 1))),
                                                                                                    ],
                                                                                                  ),
                                                                                                  SizedBox(height: ScreenUtil().setHeight(8)),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Icon(Icons.where_to_vote_outlined,
                                                                                                          size: ScreenUtil().setSp(16),
                                                                                                          color: Color.fromRGBO(124, 124, 124, 1)),
                                                                                                      SizedBox(width: ScreenUtil().setWidth(5)),
                                                                                                      Text('KingGYM',
                                                                                                          style: TextStyle(
                                                                                                              color:
                                                                                                                  Color.fromRGBO(124, 124, 124, 1))),
                                                                                                    ],
                                                                                                  )
                                                                                                ],
                                                                                              )
                                                                                            ],
                                                                                          )))
                                                                                else
                                                                                  Container(
                                                                                      width: ScreenUtil().setWidth(280),
                                                                                      decoration: BoxDecoration(
                                                                                          color: Color.fromRGBO(244, 244, 244, 1),
                                                                                          borderRadius: BorderRadius.circular(10)),
                                                                                      child: Padding(
                                                                                          padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                                                                                          child: Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.perm_identity,
                                                                                                size: ScreenUtil().setSp(20),
                                                                                              ),
                                                                                              SizedBox(width: ScreenUtil().setWidth(10)),
                                                                                              Column(
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text('${value[index]}',
                                                                                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                                                                                  SizedBox(height: ScreenUtil().setHeight(8)),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Icon(Icons.watch_later_outlined,
                                                                                                          size: ScreenUtil().setSp(16),
                                                                                                          color: Color.fromRGBO(124, 124, 124, 1)),
                                                                                                      SizedBox(width: ScreenUtil().setWidth(5)),
                                                                                                      Text('${index + 8}:00 - ${index + 9}:00',
                                                                                                          style: TextStyle(
                                                                                                              color:
                                                                                                                  Color.fromRGBO(124, 124, 124, 1))),
                                                                                                    ],
                                                                                                  ),
                                                                                                  SizedBox(height: ScreenUtil().setHeight(8)),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Icon(Icons.where_to_vote_outlined,
                                                                                                          size: ScreenUtil().setSp(16),
                                                                                                          color: Color.fromRGBO(124, 124, 124, 1)),
                                                                                                      SizedBox(width: ScreenUtil().setWidth(5)),
                                                                                                      Text('KingGYM',
                                                                                                          style: TextStyle(
                                                                                                              color:
                                                                                                                  Color.fromRGBO(124, 124, 124, 1))),
                                                                                                    ],
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          )))
                                                                              ],
                                                                            )),
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      height: ScreenUtil().setHeight(50),
                                                                      margin: const EdgeInsets.symmetric(
                                                                        horizontal: 12.0,
                                                                        vertical: 4.0,
                                                                      ),
                                                                      child: InkWell(
                                                                        onTap: () => print('${int.parse(DateFormat.H().format(DateTime.now()))}'),
                                                                        child: Card(
                                                                          elevation: 0,
                                                                          child: Container(
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                                                              child: Padding(
                                                                                  padding: EdgeInsets.all(15),
                                                                                  child: Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [],
                                                                                  ))),
                                                                        ),
                                                                      ),
                                                                    )
                                                            else if ((index > value.length - 1) && (isfirst == true))
                                                              listEvents[DateTime.utc(
                                                                              int.parse(DateFormat.y().format(DateTime.now())),
                                                                              int.parse(DateFormat.M().format(DateTime.now())),
                                                                              int.parse(DateFormat.d().format(DateTime.now())))]![index]
                                                                          .title ==
                                                                      ''
                                                                  ? Container(
                                                                      height: ScreenUtil().setHeight(50),
                                                                    )
                                                                  : Container(
                                                                      child: InkWell(
                                                                        onTap: () => print(
                                                                            '${listEvents[DateTime.utc(int.parse(DateFormat.y().format(DateTime.now())), int.parse(DateFormat.M().format(DateTime.now())), int.parse(DateFormat.d().format(DateTime.now())))]![index]}'),
                                                                        child: Card(
                                                                            elevation: 0,
                                                                            child: Column(
                                                                              children: [
                                                                                Container(
                                                                                    width: ScreenUtil().setWidth(280),
                                                                                    decoration: BoxDecoration(
                                                                                        color: index + 8 >=
                                                                                                int.parse(DateFormat.H().format(DateTime.now()))
                                                                                            ? colors[index].withOpacity(0.07)
                                                                                            : Color.fromRGBO(244, 244, 244, 1),
                                                                                        borderRadius: BorderRadius.circular(10)),
                                                                                    child: Padding(
                                                                                        padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                                                                                        child: Row(
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.perm_identity,
                                                                                              size: ScreenUtil().setSp(20),
                                                                                            ),
                                                                                            SizedBox(width: ScreenUtil().setWidth(10)),
                                                                                            Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                    '${listEvents[DateTime.utc(int.parse(DateFormat.y().format(DateTime.now())), int.parse(DateFormat.M().format(DateTime.now())), int.parse(DateFormat.d().format(DateTime.now())))]![index]}',
                                                                                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                                                                                SizedBox(height: ScreenUtil().setHeight(8)),
                                                                                                Row(
                                                                                                  children: [
                                                                                                    Icon(Icons.watch_later_outlined,
                                                                                                        size: ScreenUtil().setSp(16),
                                                                                                        color: Color.fromRGBO(124, 124, 124, 1)),
                                                                                                    SizedBox(width: ScreenUtil().setWidth(5)),
                                                                                                    Text('${index + 8}:00 - ${index + 9}:00',
                                                                                                        style: TextStyle(
                                                                                                            color: Color.fromRGBO(124, 124, 124, 1))),
                                                                                                  ],
                                                                                                ),
                                                                                                SizedBox(height: ScreenUtil().setHeight(8)),
                                                                                                Row(
                                                                                                  children: [
                                                                                                    Icon(Icons.where_to_vote_outlined,
                                                                                                        size: ScreenUtil().setSp(16),
                                                                                                        color: Color.fromRGBO(124, 124, 124, 1)),
                                                                                                    SizedBox(width: ScreenUtil().setWidth(5)),
                                                                                                    Text('KingGYM',
                                                                                                        style: TextStyle(
                                                                                                            color: Color.fromRGBO(124, 124, 124, 1))),
                                                                                                  ],
                                                                                                )
                                                                                              ],
                                                                                            )
                                                                                          ],
                                                                                        )))
                                                                              ],
                                                                            )),
                                                                      ),
                                                                    )
                                                            else
                                                              Container(
                                                                height: ScreenUtil().setHeight(50),
                                                                margin: const EdgeInsets.symmetric(
                                                                  horizontal: 12.0,
                                                                  vertical: 4.0,
                                                                ),
                                                                child: InkWell(
                                                                  onTap: () => print('${int.parse(DateFormat.H().format(DateTime.now()))}'),
                                                                  child: Card(
                                                                    elevation: 0,
                                                                    child: Container(
                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                                                        child: Padding(
                                                                            padding: EdgeInsets.all(15),
                                                                            child: Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [],
                                                                            ))),
                                                                  ),
                                                                ),
                                                              )
                                                          ],
                                                        )
                                              ],
                                            );
                                          })
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                      ],
                    ))
                  ],
                )
              ]))
            ],
          )),
    );
  }
}

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}
