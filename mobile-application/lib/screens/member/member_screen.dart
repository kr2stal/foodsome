import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../models/member/member_list_model.dart';
import '../../models/notice/notice_model.dart';
import '../../providers/member/member_provider.dart';
import '../../providers/notice/notice_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/common/common_textfield_widget.dart';
import '../../widgets/member/member_tile_widget.dart';
import '../class/class_list_screen.dart';

class MemberScreen extends StatefulWidget {
  MemberScreen({super.key}) {
    getMyInfo();
  }
  String? memberId, companyCd;

  getMyInfo() {
    Box userBox = Hive.box('USER_INFO');
    memberId = userBox.get('userId');
    companyCd = userBox.get('companyCd');
  }

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController _textController = TextEditingController();

  Map paramMap = {};
  bool isLoading = false;
  int page = 1, total = 0;
  late String? memberId, companyCd;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    memberId = widget.memberId;
    companyCd = widget.companyCd;
    paramMap = {
      'companyCd': companyCd,
      'memberId': memberId,
      'pageRowNum': 10,
      'page': page,
    };
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _textController.dispose();
    super.dispose();
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

  _buildProceedingList({type}) {
    List<MemberListModel> members = [];

    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(getMemberListProvider(paramMap));
        data.when(
          data: (data) {
            data!.listData.map((member) => members.add(member)).toList();
            total = int.parse(data.listTotal);
            if (type == ViewType.end) members.shuffle();
            isLoading = false;
          },
          loading: () => isLoading = true,
          error: (e, st) {
            print('screen error');
            isLoading = false;
          },
        );

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(16),
          ),
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(34)),
              searchTextfieldWidget(controller: _textController, label: '회원을 검색해보세요.'),
              SizedBox(height: ScreenUtil().setHeight(24)),
              Expanded(
                  child: NotificationListener<OverscrollNotification>(
                onNotification: (OverscrollNotification scrollInfo) {
                  if (!isLoading && (scrollInfo.overscroll > 0) && (members.length < total)) {
                    _loadData(ref);
                  }
                  return true;
                },
                child: ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(12)),
                    child: MemberTileWidget(member: members[index]),
                  ),
                ),
              )),
              Container(
                height: isLoading ? 100.0 : 0,
                color: Colors.transparent,
                child: Center(
                  child: isLoading ? CircularProgressIndicator() : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildEndList() {
    return Container(
      color: Colors.green[200],
      alignment: Alignment.center,
      child: Text(
        'Tab2 View',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffE5E5E5)))),
          height: ScreenUtil().setHeight(50),
          child: TabBar(
            tabs: [Text('진행중'), Text('종료')],
            indicatorColor: PRIMARY_COLOR,
            labelColor: Color(0xff333333),
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NanumSquare', fontSize: ScreenUtil().setSp(18)),
            unselectedLabelColor: Color(0xffA3A3A3),
            unselectedLabelStyle: TextStyle(fontSize: ScreenUtil().setSp(18), fontFamily: 'NanumSquare'),
            controller: _tabController,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildProceedingList(type: ViewType.proceeding),
              _buildProceedingList(type: ViewType.end),
              // _buildEndList(),
            ],
          ),
        ),
      ],
    );
  }
}
