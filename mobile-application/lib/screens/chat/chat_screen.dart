import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../models/chat/chat_list_model.dart';
import '../../models/notice/notice_model.dart';
import '../../providers/chat/chat_provider.dart';
import '../../providers/notice/notice_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/chat/chat_tile_widget.dart';
import '../../widgets/common/common_textfield_widget.dart';
import '../../widgets/member/member_tile_widget.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key}) {
    getMyInfo();
  }
  String? memberId, companyCd;

  getMyInfo() {
    Box userBox = Hive.box('USER_INFO');
    memberId = userBox.get('userId');
    companyCd = userBox.get('companyCd');
  }

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
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
    // chatRooms = [];
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

  _buildMemberChatList() {
    List<ChatListModel> _chatRooms = [];

    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(getChatListProvider(paramMap));
        data.when(
          data: (data) {
            data!.listData.map((chat) => _chatRooms.add(chat)).toList();
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
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(16),
          ),
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(34)),
              searchTextfieldWidget(controller: _textController, label: '채팅방, 참여자를 검색해보세요.'),
              SizedBox(height: ScreenUtil().setHeight(24)),
              Expanded(
                  child: NotificationListener<OverscrollNotification>(
                      onNotification: (OverscrollNotification scrollInfo) {
                        if (!isLoading && (scrollInfo.overscroll > 0) && (_chatRooms.length < total)) {
                          _loadData(ref);
                        }
                        return true;
                      },
                      child: ListView.builder(
                        itemCount: _chatRooms.length,
                        itemBuilder: (BuildContext context, int index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(16)),
                          child: ChatTileWidget(
                            chat: _chatRooms[index],
                          ),
                        ),
                      ))),
              Container(
                height: isLoading ? 30.0 : 0,
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

  _buildNonMemberChatList() {
    List<ChatListModel> _chatRooms = [];

    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(getNonMemberChatListProvider(paramMap));
        data.when(
          data: (data) {
            data!.listData.map((chat) => _chatRooms.add(chat)).toList();
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
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(16),
          ),
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(34)),
              searchTextfieldWidget(controller: _textController, label: '채팅방, 참여자를 검색해보세요.'),
              SizedBox(height: ScreenUtil().setHeight(24)),
              Expanded(
                  child: NotificationListener<OverscrollNotification>(
                      onNotification: (OverscrollNotification scrollInfo) {
                        if (!isLoading && (scrollInfo.overscroll > 0) && (_chatRooms.length < total)) {
                          _loadData(ref);
                        }
                        return true;
                      },
                      child: ListView.builder(
                        itemCount: _chatRooms.length,
                        itemBuilder: (BuildContext context, int index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(16)),
                          child: ChatTileWidget(
                            chat: _chatRooms[index],
                          ),
                        ),
                      ))),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffE5E5E5)))),
          height: ScreenUtil().setHeight(50),
          child: TabBar(
            tabs: [Text('회원'), Text('비회원')],
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
              _buildMemberChatList(),
              _buildNonMemberChatList(),
            ],
          ),
        ),
      ],
    );
  }
}
