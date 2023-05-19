import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/images.dart';
import '../../models/class/class_list_model.dart';
import '../../providers/theme_provider.dart';
import '../../screens/class/class_list_screen.dart';

class ClassTileWidget extends StatefulWidget {
  ClassTileWidget({super.key, required this.widthSize, required this.cls, required this.view});
  final double widthSize;
  final ClassListModel cls;
  final Enum view;

  @override
  State<ClassTileWidget> createState() => _ClassTileWidgetState();
}

class _ClassTileWidgetState extends State<ClassTileWidget> with SingleTickerProviderStateMixin {
  double? widthSize;
  ClassListModel? cls;
  dynamic? view;
  double ratio = 0.0;

  @override
  initState() {
    widthSize = widget.widthSize;
    cls = widget.cls;
    view = widget.view;
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        ratio = cls!.doneCls! / cls!.totalCls!;
      });
    });

    super.initState();
  }

  _statusProgress() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              view == ViewType.recruiting ? '모집현황' : '진행율',
              style: TextStyle(fontSize: ScreenUtil().setSp(12), color: Color(0xffA3A3A3)),
            ),
            Text.rich(TextSpan(
                text: cls!.doneCls.toString(),
                style: TextStyle(fontSize: ScreenUtil().setSp(16), color: view == ViewType.end ? Color(0xffA3A3A3) : Color(0xff5063EE)),
                children: [
                  TextSpan(
                    text: '/${cls!.totalCls}',
                    style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Color(0xffA3A3A3)),
                  )
                ]))
          ],
        ),
        SizedBox(height: ScreenUtil().setHeight(6)),
        Stack(
          children: [
            Container(
              height: ScreenUtil().setHeight(5),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: view == ViewType.end ? Color(0xffA3A3A3) : Color(0xffE9E9E9),
              ),
            ),
            if (view != ViewType.end)
              AnimatedSize(
                duration: Duration(milliseconds: 500),
                // curve: Curves.easeInOut,
                child: Container(
                  height: ScreenUtil().setHeight(5),
                  width: widthSize! * ratio,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: PRIMARY_COLOR,
                  ),
                ),
              )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          Container(
              height: ScreenUtil().setHeight(108),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffE6E6E6),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  GImages().getClsImage('${cls!.image}'),
                  fit: BoxFit.fitWidth,
                  cacheWidth: 500,
                ),
              )),
          if (view == ViewType.recruiting)
            Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: ScreenUtil().setWidth(55),
                  height: ScreenUtil().setHeight(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffFE007C),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                          size: ScreenUtil().setWidth(15),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        Text(cls!.favorit!, style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Colors.white)),
                      ],
                    ),
                  ),
                ))
        ]),

        // child: Image.asset('assets/images/cls1.jpg')),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${cls!.location} | ${cls!.exercise}',
              style: TextStyle(color: Color(0xffA3A3A3), fontSize: ScreenUtil().setSp(14)),
            ),
            GestureDetector(
              child: Icon(Icons.more_horiz, color: Color(0xff7C7C7C)),
            )
          ],
        ),
        Text(cls!.classNm, style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold)),
        Spacer(),
        _statusProgress()
      ],
    ));
  }
}
