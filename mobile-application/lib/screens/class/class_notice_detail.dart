import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../providers/theme_provider.dart';

class ClassNoticeDetailScreen extends ConsumerStatefulWidget {
  int index;
  ClassNoticeDetailScreen(this.index, {Key? key}) : super(key: key);

  @override
  ClassNoticeDetailScreenState createState() => ClassNoticeDetailScreenState();
}

class ClassNoticeDetailScreenState extends ConsumerState<ClassNoticeDetailScreen> {
  final GlobalKey _mainSectionKey = GlobalKey();
  late int index;
  TextStyle titleTextStyle = TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold);

  List noticeList =[
    {'title': '[공지] 수업 특성상 커리큘럼이 유연하게 변경될 수 있음을 항상 염두에 두시기 바랍니다', 'date': '02. 12. 토'},
    {'title': '[일반] 8월 26일 금요일 개인적인 사정으로 인해 하루만 쉬어가도록하겠습니다', 'date': '08. 16. 화'},
    {'title': '[일반] 5월 12일 부터 19일 까지 체육관 내부 공사로 인해 부득이 하게 휴관을 해야할 것 같습니다. 참고 바랍니다.', 'date': '04. 24. 일'},
    {'title': '[일반] 8월 26일 금요일 개인적인 사정으로 하루만 쉬어가도록하겠습니다', 'date': '08. 16. 화'},
    {'title': '[일반] 5월 12일 부터 19일 까지 체육관 내부 공사로 인해 부득이 하게 휴관을 해야할 것 같습니다. 참고 바랍니다.', 'date': '08. 16. 화'}
  ];

  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  void dispose() {
    widget.index = 0;
    super.dispose();
  }

  _buildNoticeSection(index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: ScreenUtil().setHeight(546),
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenUtil().setHeight(16)),
                    Text(noticeList[index+1]['title'],
                      style: TextStyle(fontSize: ScreenUtil().setSp(18), color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Text(
                      '08. 16. 화',
                      style: TextStyle(fontSize: ScreenUtil().setSp(13), color: Color(0xffA3A3A3)),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(16)),
                    Container(
                      height: ScreenUtil().setHeight(3),
                      color: Color.fromRGBO(245, 246, 250, 1),
                      width: double.infinity,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(32)),
                    Text('안녕하세요!\n다름이 아니라, 돌아오는 금요일 8월26일에\n개인적인 사정으로 인해 하루만 쉬어가려 합니다.\n\n혼돈 없으시길 바라고, 죄송합니다.\n\n금요일에 수업을 예약하신 회원님들은 취소할 예정이니 다른 날 다시 예약 부탁드립니다.\n\n감사합니다.',
                      style: TextStyle(fontSize: ScreenUtil().setSp(15), color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ],
                )
              )
            )
          ),
          SizedBox(height: ScreenUtil().setHeight(48)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      // backgroundColor: Colors.white,
      toolbarHeight: 90,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Color.fromRGBO(245, 246, 250, 1),
      title: Text(
        '공지사항',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22)),
      ),
      titleSpacing: 0,
      centerTitle: false,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Edit',
            style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
          )
        )
      ],
    ),
      body: Container( 
        color: Color.fromRGBO(245, 246, 250, 1),
        child : CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    key: _mainSectionKey,
                    children: [
                      _buildNoticeSection(index),
                    ],
                  )
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}