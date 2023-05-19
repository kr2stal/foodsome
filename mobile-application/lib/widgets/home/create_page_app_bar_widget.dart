import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePageAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  CreatePageAppBarWidget(this.title, {super.key, this.actions});
  String title;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(22)),
      ),
      centerTitle: false,
      actions: actions ?? [
        new IconButton(
          onPressed: () {
            showDialog(
            context: context, 
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text('작성을 중단하시겠습니까?', style: TextStyle(color: Colors.black, fontSize: 18)),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                      Navigator.pop(context, true);
                    },
                    child: Text('네')
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('아니요')
                  )
                ],
              );
            }
            );
          }, 
          icon: Icon(Icons.close_rounded, size: ScreenUtil().setSp(22),)
        )
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}