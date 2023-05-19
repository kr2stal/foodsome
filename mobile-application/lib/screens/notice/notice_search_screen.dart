import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/common/common_textfield_widget.dart';

class NoticeSearchScreen extends StatelessWidget {
  NoticeSearchScreen({Key? key}) : super(key: key);
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: ScreenUtil().setHeight(100),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            titleSpacing: 0,
            centerTitle: false,
            title: Container(
                height: ScreenUtil().setHeight(60),
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(16)),
                child: searchTextfieldWidget(controller: _controller, label: '알림 내역을 검색해 보세요.'))),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Text(''),
        ),
      ),
    );
  }
}
