import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../constants/icons.dart';
import '../../screens/home/trainer_home_layout.dart';
import '../../screens/notice/notice_screen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget(this.title);

  final String? title;
  final Box userBox = Hive.box('USER_INFO');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!, style: TextStyle(color: Colors.black)),
      leading: IconButton(
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
        icon: Container(
          width: ScreenUtil().setWidth(22),
          // margin: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
          child: Image.asset(
            GIcons.MENU_S,
            fit: BoxFit.fitWidth,
            cacheWidth: 50,
          ),
        ),
      ),
      elevation: 0,
      // backgroundColor: Colors.white,
      actions: [
        GestureDetector(
          onTap: () async {
            // 알림 화면으로 이동
            Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeScreen()));
          },
          child: Container(
            width: ScreenUtil().setWidth(25),
            // margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(16)),
            child: Image.asset(
              GIcons.NOTI_S,
              fit: BoxFit.fitWidth,
              cacheWidth: 100,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
