import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/icons.dart';
import '../../models/notice/notice_model.dart';
import '../../screens/chat/chat_detail_screen.dart';
import '../../screens/class/review_detail_screen.dart';
import '../../screens/notice/booking_request_screen.dart';
import '../../utils.dart';

final noticeType = {'D': '식단기록', 'E': '운동기록', 'R': '리뷰', 'B': '예약요청', 'M': '메시지'};
final noticeMsg = {
  'D': ' 회원님이 식단을 기록했어요.',
  'E': ' 회원님이 운동을 기록했어요.',
  'R': "'헬스다이어트반'클래스에 새로운 리뷰가 등록되었어요.",
  'B': ' 회원님에게서 예약요청이 왔어요.',
  'M': ' 회원님에게서 메시지가 왔어요.'
};

class NoticeTileWidget extends StatelessWidget with UtilsForDate {
  NoticeTileWidget({Key? key, required this.notice}) : super(key: key);
  final NoticeModel notice;

  @override
  Widget build(BuildContext context) {
    bool isPrevDay = false;
    DateTime today = DateTime(2022, 12, 17);
    DateTime regDay = notice.regDt ?? DateTime.now().subtract(Duration(days: 1));

    if (DateTime(regDay.year, regDay.month, regDay.day).isBefore(DateTime(today.year, today.month, today.day))) isPrevDay = true;

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(16),
          vertical: ScreenUtil().setHeight(16),
        ),
        decoration: BoxDecoration(
          color: isPrevDay ? Color(0xffEFEFEF) : Color(0xffF1F4FD),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  // Icon(Icons.notifications),
                  Container(
                    width: ScreenUtil().setWidth(24),
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
                    child: Image.asset(
                      GIcons.NOTI_SS,
                      cacheWidth: 50,
                    ),
                  ),
                  Text(
                    noticeType[notice.type]!,
                    style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold),
                  )
                ]),
                Text(
                  timeFormatter(notice.regDt!),
                  style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xff575757)),
                )
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(17)),
            Text(
              notice.type == 'R' ? '${noticeMsg[notice.type]}' : '${notice.memberNm!}${noticeMsg[notice.type]}',
              style: TextStyle(fontSize: ScreenUtil().setSp(17)),
            ),
            SizedBox(height: ScreenUtil().setHeight(7)),
            Text(
              notice.type == 'B' ? dateToStringWithHoursEn(notice.booking!) : '',
              style: TextStyle(fontSize: ScreenUtil().setSp(15), color: Color(0xff575757)),
            ),
          ],
        ),
      ),
      onTap: () async {
        if (notice.type == 'B') Navigator.push(context, MaterialPageRoute(builder: (context) => BookingRequestScreen(notice: notice)));
        if (notice.type == 'E' || notice.type == 'D' || notice.type == 'M')
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatDetailScreen(userInfoMap: {'name': notice.memberNm}, type: notice.type!)));

        if (notice.type == 'R') Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewDetailScreen()));
        // if (notice.type == 'M') Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewDetailScreen()));
      },
    );
  }
}
