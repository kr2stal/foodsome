import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/icons.dart';
import '../../models/chat/chat_list_model.dart';
import '../../providers/theme_provider.dart';
import '../../screens/chat/chat_detail_screen.dart';
import '../../utils.dart';

class ChatTileWidget extends StatelessWidget with UtilsForDate {
  ChatTileWidget({Key? key, required this.chat}) : super(key: key);
  final ChatListModel chat;

  @override
  Widget build(BuildContext context) {
    bool isPrevDay = false;
    DateTime today = DateTime(2022, 12, 17);
    DateTime regDay = chat.regDt ?? DateTime.now().subtract(Duration(days: 1));

    if (DateTime(regDay.year, regDay.month, regDay.day).isBefore(DateTime(today.year, today.month, today.day))) isPrevDay = true;

    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: ScreenUtil().setWidth(45),
              child: Image.asset(
                GIcons.PERSON_S,
                fit: BoxFit.fitWidth,
                cacheWidth: 100,
              ),
            ),
            SizedBox(width: ScreenUtil().setWidth(23)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(clipBehavior: Clip.none, children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: ScreenUtil().setWidth(10),
                          ),
                          child: Text(chat.memberNm!, style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold)),
                        ),
                        if (chat.readYn == 'N')
                          Positioned(
                              right: 0,
                              top: -5,
                              child: Container(
                                width: ScreenUtil().setWidth(6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: PRIMARY_COLOR,
                                ),
                                child: Text(''),
                              ))
                      ]),
                      Text(!isPrevDay ? dateToTime(chat.regDt!) : '어제', style: TextStyle(fontSize: ScreenUtil().setSp(13), color: Color(0xff7C7C7C)))
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(11)),
                  Text(chat.summary!, style: TextStyle(fontSize: ScreenUtil().setSp(15), color: Color(0xff7C7C7C))),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () async {
        Map userInfo = {};
        userInfo.addAll({'name': chat.memberNm, 'id': 'choi'});
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen(userInfoMap: userInfo, type: chat.type!)));
      },
    );
  }
}
