import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'class_create_screen2.dart';

final classCreateIndex = StateProvider((_) => 0);

class ClassCreateScreen11 extends StatefulWidget {
  ClassCreateScreen11({Key? key}) : super(key: key);
  
  @override
  State<ClassCreateScreen11> createState() => _ClassCreateScreen11State();
}


class _ClassCreateScreen11State extends State<ClassCreateScreen11> {
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        child: CustomScrollView(
          controller: _scrollController, 
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    key: _mainSectionKey,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: ScreenUtil().setHeight(148)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
                              child: Container(
                                height: ScreenUtil().setHeight(263),
                                width: ScreenUtil().setWidth(326),
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/cls12.jpg'))
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(36)),
                            Text('클래스가 생성되었습니다.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(18)),),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]
        ),
      ),
      )
    );
  }
}