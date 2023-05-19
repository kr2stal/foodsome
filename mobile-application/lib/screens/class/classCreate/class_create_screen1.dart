import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/home/create_page_app_bar_widget.dart';

final classCreateIndex = StateProvider((_) => 0);

class ClassCreateScreen1 extends StatefulWidget {
  ClassCreateScreen1({Key? key}) : super(key: key);
  
  @override
  State<ClassCreateScreen1> createState() => _ClassCreateScreen1State();
}


class _ClassCreateScreen1State extends State<ClassCreateScreen1> {
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreatePageAppBarWidget(
        '클래스 생성',
      ),
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
                            SizedBox(height: ScreenUtil().setHeight(132)),
                            Text('새로운 클래스를\n만들어 볼까요?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            SizedBox(height: ScreenUtil().setHeight(90)),
                            Container(
                              height: ScreenUtil().setHeight(278),
                              width: ScreenUtil().setWidth(326),
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/cls12.jpg')),
                              ),
                            )
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