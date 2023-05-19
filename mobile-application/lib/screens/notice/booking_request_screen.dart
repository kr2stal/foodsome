import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/notice/notice_model.dart';
import '../../providers/theme_provider.dart';

class BookingRequestScreen extends StatelessWidget {
  BookingRequestScreen({Key? key, this.notice}) : super(key: key);
  NoticeModel? notice;

  Widget husomeFilledButton({
    double? width,
    double? height,
    Color? borderColor,
    required String? label,
    required Color? bgColor,
    required void Function()? callbackFn,
  }) {
    bool? isBrigthColor;

    bgColor!.red > 230 && bgColor.green > 230 && bgColor.blue > 230 ? isBrigthColor = true : isBrigthColor = false;

    return Flexible(
      flex: 1,
      child: InkWell(
          onTap: callbackFn,
          child: Container(
            alignment: Alignment.center,
            height: (height != null) ? height : ScreenUtil().setHeight(56),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: bgColor,
                border: borderColor != null ? Border.all(color: borderColor, width: 3) : null),
            child: Text(
              label!,
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22), color: isBrigthColor ? Color(0xff333333) : Colors.white),
            ),
          )),
    );
  }

  requestOkCancelDialog({context, label}) async => await showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
            content: Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Text.rich(
                TextSpan(
                    text: '최바람님의 예약요청을\n',
                    style: TextStyle(
                      fontFamily: 'NanumSqure', fontSize: ScreenUtil().setSp(17), fontWeight: FontWeight.bold,
                      // color: PRIMARY_COLOR,
                    ),
                    children: [TextSpan(text: label, style: TextStyle(color: PRIMARY_COLOR)), TextSpan(text: '하시겠습니까?')]),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                    child: Text(
                      '아니오',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontFamily: 'NanumSqure',
                        fontSize: ScreenUtil().setSp(18),
                        color: Color(0xff575757),
                      ),
                    )),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(
                  '네',
                  style: TextStyle(
                    fontFamily: 'NanumSqure',
                    fontSize: ScreenUtil().setSp(18),
                    color: PRIMARY_COLOR,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              )
            ]);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      appBar: AppBar(
        backgroundColor: Color(0xffF5F6FA),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   statusBarColor: Color(0xffF5F6FA),
        // ),
        title: Text(
          '예약요청',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22)),
        ),
        titleSpacing: 0,
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
        color: Color(0xffF5F6FA),
        child: Container(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(25),
              bottom: ScreenUtil().setHeight(30),
              left: ScreenUtil().setWidth(16),
              right: ScreenUtil().setWidth(16),
            ),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '최바람 님의 예약 요청',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22)),
                ),
                Divider(
                  height: ScreenUtil().setHeight(32),
                  color: Color(0xffE5E5E5),
                  thickness: 1,
                ),
                Row(children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      width: ScreenUtil().setWidth(60),
                      child: Text('클래스', style: TextStyle(color: Color(0xffA3A3A3), fontSize: ScreenUtil().setSp(15)))),
                  Text('헬스 왕초보 퍼스널 트레이닝', style: TextStyle(fontSize: ScreenUtil().setSp(18)))
                ]),
                SizedBox(height: ScreenUtil().setHeight(12)),
                Row(children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      width: ScreenUtil().setWidth(60),
                      child: Text('일정', style: TextStyle(color: Color(0xffA3A3A3), fontSize: ScreenUtil().setSp(15)))),
                  Text('2022. 04. 30(토) AM 10:00', style: TextStyle(fontSize: ScreenUtil().setSp(18)))
                ]),
                SizedBox(height: ScreenUtil().setHeight(12)),
                Row(children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      width: ScreenUtil().setWidth(60),
                      child: Text('장소', style: TextStyle(color: Color(0xffA3A3A3), fontSize: ScreenUtil().setSp(15)))),
                  Text('KingGYM', style: TextStyle(fontSize: ScreenUtil().setSp(18))),
                ]),
                SizedBox(height: ScreenUtil().setHeight(35)),
                Row(
                  children: [
                    husomeFilledButton(
                        label: '거절',
                        bgColor: Color(0xffEFEFEF),
                        callbackFn: () async {
                          requestOkCancelDialog(context: context, label: '거절');
                        }),
                    SizedBox(width: ScreenUtil().setWidth(8)),
                    husomeFilledButton(
                        label: '수락',
                        bgColor: PRIMARY_COLOR,
                        callbackFn: () async {
                          requestOkCancelDialog(context: context, label: '수락');
                        }),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
