import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubpageAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  SubpageAppBarWidget(this.title, {super.key, this.actions, this.color});
  String title;
  List<Widget>? actions;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: color,
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22)),
      ),
      titleSpacing: 0,
      centerTitle: false,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
