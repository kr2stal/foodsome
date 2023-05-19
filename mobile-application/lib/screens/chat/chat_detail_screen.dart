import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/icons.dart';
import '../../constants/images.dart';
import '../../providers/theme_provider.dart';
import '../../utils.dart';
import '../../widgets/common/common_textfield_widget.dart';
import '../../widgets/home/subpage_app_bar_widget.dart';

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen({super.key, required this.userInfoMap, required this.type});
  Map userInfoMap;
  String type;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> with UtilsForDate {
  ScrollController _scrollController = ScrollController();
  TextEditingController _textController = TextEditingController();

  List dietChat = [
    {'date': DateTime.now(), 'regUserId': 'choi', 'content': '회원님 식사 하셨나요?'},
    {'date': DateTime.now().add(Duration(minutes: 5)), 'regUserId': '최바람', 'content': 'yes. 질문 again??'},
  ];

  List excerciseChat = [
    {'date': DateTime.now(), 'regUserId': 'choi', 'content': '회원님 운동 하셨나요?'},
    {'date': DateTime.now().add(Duration(minutes: 5)), 'regUserId': '최바람', 'content': 'yes. 질문 again??'},
  ];

  List qnaChat = [
    {'date': DateTime.now(), 'regUserId': '윤지오', 'content': '안녕하세요! 클래스 문의 하려고 하는데요..'},
    {'date': DateTime.now().add(Duration(minutes: 5)), 'regUserId': 'choi', 'content': '네, 편하게 물어보세요!'},
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  _buildMyMessage(Map _message) {
    return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(40)),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(dateToTime(_message['date']), style: TextStyle(color: Color(0xff7C7C7C), fontSize: ScreenUtil().setSp(12))),
        SizedBox(width: ScreenUtil().setWidth(10)),
        Container(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(10),
            bottom: ScreenUtil().setHeight(12),
            left: ScreenUtil().setWidth(13),
            right: ScreenUtil().setWidth(13),
          ),
          decoration: BoxDecoration(
              color: PRIMARY_COLOR,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
          child: Text(
            _message['content'],
            style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(14)),
          ),
        )
      ]),
    );
  }

  _buildYourMessage({required Map msg, required String type}) {
    return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(40)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: ScreenUtil().setWidth(25),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: PRIMARY_COLOR),
              child: Image.asset(
                GIcons.PERSON_SS,
                cacheWidth: 50,
              ),
            ),
          ),
        ),
        SizedBox(width: ScreenUtil().setWidth(10)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.userInfoMap['name'], style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold)),
                SizedBox(height: ScreenUtil().setHeight(5)),
                widget.type == 'Q'
                    ? Container(
                        width: ScreenUtil().setWidth(190),
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(10),
                          bottom: ScreenUtil().setHeight(12),
                          left: ScreenUtil().setWidth(13),
                          right: ScreenUtil().setWidth(13),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffE9E9E9),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: Text(
                          msg['content'],
                          style: TextStyle(color: Color(0xff333333), fontSize: ScreenUtil().setSp(14)),
                        ))
                    : Container(
                        width: ScreenUtil().setWidth(190),
                        decoration: BoxDecoration(
                            // color: Color(0xffE9E9E9),
                            color: Color(0xffF5F6FA),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                              ),
                              child: type == 'D'
                                  ? Image.asset(
                                      GImages.FOOD,
                                      cacheWidth: 300,
                                    )
                                  : Container(
                                      width: ScreenUtil().setWidth(120),
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                        GImages.MUSCLE,
                                        cacheWidth: 300,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffE9E9E9),
                                  borderRadius: BorderRadius.only(
                                    // topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                              padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(10),
                                bottom: ScreenUtil().setHeight(12),
                                left: ScreenUtil().setWidth(13),
                                right: ScreenUtil().setWidth(13),
                              ),
                              child: Column(
                                children: [
                                  widget.type == 'D'
                                      ? Text(
                                          '${widget.userInfoMap['name']} 회원님이 점심식단을 기록했어요! 평가해 주세요:)',
                                          style: TextStyle(color: Color(0xff333333), fontSize: ScreenUtil().setSp(14)),
                                        )
                                      : Text(
                                          '${widget.userInfoMap['name']} 회원님이 운동을 기록했어요! 평가해 주세요:)',
                                          style: TextStyle(color: Color(0xff333333), fontSize: ScreenUtil().setSp(14)),
                                        ),
                                  SizedBox(height: ScreenUtil().setHeight(10)),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      '피드백 남기기',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Color(0xff333333), fontSize: ScreenUtil().setSp(14)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
              ],
            ),
            SizedBox(width: ScreenUtil().setWidth(10)),
            Text(dateToTime(msg['date']), style: TextStyle(color: Color(0xff7C7C7C), fontSize: ScreenUtil().setSp(12))),
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: SubpageAppBarWidget(
          widget.userInfoMap['name'],
          actions: [
            IconButton(
                // padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () async {
                  // await Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeSearchScreen()));
                },
                icon: Icon(Icons.search),
                color: PRIMARY_COLOR),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  if (widget.type == 'D')
                    ...List.generate(dietChat.length, (int idx) {
                      return Container(
                        width: double.infinity,
                        child: dietChat[idx]['regUserId'] == 'choi'
                            ? _buildMyMessage(dietChat[idx])
                            : _buildYourMessage(msg: dietChat[idx], type: widget.type),
                      );
                    }),
                  if (widget.type == 'E')
                    ...List.generate(excerciseChat.length, (int idx) {
                      return Container(
                        width: double.infinity,
                        child: excerciseChat[idx]['regUserId'] == 'choi'
                            ? _buildMyMessage(excerciseChat[idx])
                            : _buildYourMessage(msg: excerciseChat[idx], type: widget.type),
                      );
                    }),
                  if (widget.type == 'Q' || widget.type == 'M')
                    ...List.generate(qnaChat.length, (int idx) {
                      return Container(
                        width: double.infinity,
                        child: qnaChat[idx]['regUserId'] == 'choi'
                            ? _buildMyMessage(qnaChat[idx])
                            : _buildYourMessage(msg: qnaChat[idx], type: widget.type),
                      );
                    }),
                  SizedBox(height: ScreenUtil().setHeight(150))
                ],
              )),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16), vertical: ScreenUtil().setHeight(5)),
          // height: ScreenUtil().setHeight(60),
          width: double.infinity,
          color: Colors.white,
          child: messageTextfieldWidget(controller: _textController, label: '메시지 보내기'),
        ),
      ),
    );
  }
}
