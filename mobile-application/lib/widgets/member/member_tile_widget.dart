import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/icons.dart';
import '../../models/member/member_list_model.dart';
import '../../providers/theme_provider.dart';
import '../../utils.dart';

class MemberTileWidget extends StatelessWidget {
  MemberTileWidget({Key? key, required this.member}) : super(key: key);
  final MemberListModel? member;

  @override
  Widget build(BuildContext context) {
    // bool isPrevDay = false;
    // DateTime today = DateTime.now();
    // DateTime regDay = member.regDt ?? DateTime.now().subtract(Duration(days: 1));

    // if (notice.regDt != null && DateTime(regDay.year, regDay.month, regDay.day).isBefore(DateTime(today.year, today.month, today.day)))
    //   isPrevDay = true;

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
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
            // SizedBox(
            //   width: ScreenUtil().setWidth(48),
            //   child: AspectRatio(
            //     aspectRatio: 1,
            //     child: Container(
            //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: PRIMARY_COLOR),
            //       child: Icon(
            //         Icons.person,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(width: ScreenUtil().setWidth(23)),
            SizedBox(
              width: ScreenUtil().setWidth(240),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(member!.memberNm, style: TextStyle(fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.bold)),
                  SizedBox(height: ScreenUtil().setHeight(11)),
                  Text(member!.classNm, style: TextStyle(fontSize: ScreenUtil().setSp(15), color: Color(0xff7C7C7C))),
                ],
              ),
            ),
            Icon(Icons.more_horiz_rounded, color: Color(0xff7C7C7C)),
          ],
        ),
      ),
      onTap: () => showNoPageToast(context),
    );
  }
}
