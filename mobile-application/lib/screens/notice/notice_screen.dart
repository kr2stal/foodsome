import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hive/hive.dart';

import '../../models/notice/notice_model.dart';
import '../../providers/notice/notice_provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils.dart';
import '../../widgets/notice/notice_tile_widget.dart';
import 'notice_search_screen.dart';

class NoticeScreen extends StatefulWidget {
  NoticeScreen({super.key}) {
    getMyInfo();
  }

  String? memberId, companyCd;

  getMyInfo() {
    Box userBox = Hive.box('USER_INFO');
    memberId = userBox.get('userId');
    companyCd = userBox.get('companyCd');
  }

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> with UtilsForDate {
  Map paramMap = {};
  late List<NoticeModel> notices;
  bool isLoading = false;
  int page = 1, total = 0;
  late String? memberId, companyCd;

  List filterList = ['전체', '예약 요청', '식단 기록', '운동 기록', '리뷰'];

  @override
  void initState() {
    memberId = widget.memberId;
    companyCd = widget.companyCd;
    paramMap = {
      'companyCd': companyCd,
      'memberId': memberId,
      'pageRowNum': 10,
      'page': page,
    };
    notices = [];
    super.initState();
  }

  Future _loadData(ref) async {
    setState(() {
      page = page + 1;

      paramMap = {
        'companyCd': companyCd,
        'memberId': memberId,
        'pageRowNum': 10,
        'page': page,
      };
    });
  }

  _buildSearchFilterSheet() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        int _selectedIndex = ref.watch(noticeFilterNotifyProvider);

        var teamListScreen = ListView.separated(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
                    height: ScreenUtil().setHeight(50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            filterList[index],
                            style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                          ),
                        ),
                        _selectedIndex == index ? Icon(Icons.check, color: PRIMARY_COLOR) : SizedBox()
                      ],
                    ),
                  ),
                  onTap: () {
                    ref.read(noticeFilterNotifyProvider.notifier).setSelectedIdx(index);
                  },
                ),
            separatorBuilder: (context, index) => Divider(color: Color(0xff333333)),
            itemCount: filterList.length);

        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Container(
                height: ScreenUtil().setHeight(5),
                width: ScreenUtil().setWidth(81),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Color(0xffE5E5E5)),
              )),
              SizedBox(height: ScreenUtil().setHeight(29)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                child: Text(
                  '필터',
                  style: TextStyle(fontSize: ScreenUtil().setSp(22), fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(25)),
              Container(padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)), child: teamListScreen),
              SizedBox(height: ScreenUtil().setHeight(30)),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                  // buildData();
                },
                child: Container(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(16)),
                    width: double.infinity,
                    height: ScreenUtil().setHeight(81),
                    color: PRIMARY_COLOR,
                    child: Text(
                      '적용하기',
                      style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(25), fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          '알림',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22)),
        ),
        titleSpacing: 0,
        centerTitle: false,
        actions: [
          IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeSearchScreen()));
              },
              icon: Icon(Icons.search),
              color: PRIMARY_COLOR),
          IconButton(
              constraints: BoxConstraints(),
              onPressed: () async {
                await showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: true,
                    context: context,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                    backgroundColor: Colors.transparent,
                    builder: (context) => _buildSearchFilterSheet()).whenComplete(() {});
              },
              icon: Icon(Icons.tune, color: PRIMARY_COLOR)),
        ],
      ),
      body: Consumer(builder: (ctx, ref, child) {
        final data = ref.watch(getNoticeListProvider(paramMap).select((value) => value));
        data.when(
          data: (data) {
            data!.listData.map((notice) => notices.add(notice)).toList();
            total = int.parse(data.listTotal);
            isLoading = false;
          },
          loading: () => isLoading = true,
          error: (e, st) {
            print('screen error');
            isLoading = false;
          },
        );

        return Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
          color: Colors.white,
          child: Column(children: [
            Expanded(
                child: NotificationListener<OverscrollNotification>(
                    onNotification: (OverscrollNotification scrollInfo) {
                      if (!isLoading && (scrollInfo.overscroll > 0) && (notices.length < total)) {
                        _loadData(ref);
                      }
                      return true;
                    },
                    child: RefreshIndicator(
                        child: GroupedListView(
                          elements: notices,
                          groupBy: (NoticeModel element) => element.regDt != null
                              ? DateTime(element.regDt!.year, element.regDt!.month, element.regDt!.day)
                              : DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().year),
                          groupSeparatorBuilder: (DateTime? value) => Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(24),
                                  bottom: ScreenUtil().setHeight(22),
                                ),
                                child: Text(
                                  dateToStringDot(value ?? DateTime.now()),
                                  style: TextStyle(fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.bold),
                                ),
                              )),
                          itemBuilder: (context, NoticeModel element) => Padding(
                            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(8)),
                            child: NoticeTileWidget(notice: element),
                          ),

                          // itemComparator: (NoticeModel item1, NoticeModel item2) => item1.regDt!.compareTo(item2.regDt!), // optional

                          order: GroupedListOrder.DESC,
                        ),
                        onRefresh: () async {
                          setState(() {
                            notices.clear();
                            page = 1;

                            paramMap = {
                              'companyCd': companyCd,
                              'memberId': memberId,
                              'pageRowNum': 10,
                              'page': page,
                            };
                          });
                        }))),
            Container(
              height: isLoading ? 100.0 : 0,
              color: Colors.transparent,
              child: Center(
                child: isLoading ? CircularProgressIndicator() : null,
              ),
            ),
          ]),
        );
      }),
    );
  }
}
