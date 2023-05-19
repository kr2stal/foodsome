import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/home/create_page_app_bar_widget.dart';
import '../class_create_screen.dart';


class ClassCreateScreen3 extends ConsumerStatefulWidget {
  int idx;
  ClassCreateScreen3(this.idx, {Key? key}) : super(key: key);
  
  @override
  ClassCreateScreen3State createState() => ClassCreateScreen3State();
}

class ClassCreateScreen3State extends ConsumerState<ClassCreateScreen3> {
  late int idx;
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  final person = List.generate(11, (i) => i);
  String _selectedValue  = '';

   @override
  void initState() {
    idx = widget.idx;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    idx = ref.watch(classCreateIndex);
    final StateController<int> classCreateIdx = ref.watch(classCreateIndex.state);
    return Scaffold(
      appBar: CreatePageAppBarWidget(
        '클래스 생성',
      ),
      body: SafeArea(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: ScreenUtil().setHeight(120)),
            Text('몇명이서 하나요?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
            SizedBox(height: ScreenUtil().setHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: ScreenUtil().setWidth(75),
                  height: ScreenUtil().setHeight(380),
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 50,
                    scrollController: FixedExtentScrollController(initialItem: 2),
                    selectionOverlay: Container(
                      color: Colors.transparent,
                    ),
                    magnification: 1.5,
                    squeeze: 1.05,
                    children: [
                      for(int i = 2; i < person.length; i++)
                      Text('${person[i]}\n', style: TextStyle(fontSize: ScreenUtil().setSp(28), fontWeight: FontWeight.normal, color: Color.fromRGBO(51, 51, 51, 1)),)
                    ],
                    onSelectedItemChanged: (value) {
                      
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10), child: Text('명', style: TextStyle(fontSize: ScreenUtil().setSp(18)),),)
              ],
            )
          ],
        ),
      ),
      ),
      bottomSheet: Container(
        height: ScreenUtil().setHeight(81),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: InkWell(
                child: Container(
                  height: ScreenUtil().setHeight(81),
                  width: double.infinity,
                  color: Color.fromRGBO(124, 124, 124, 1),

                  child: Column(
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(16)),
                      Center(
                        child: Text(
                          '이전',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),
                        ),
                      )
                    ],
                  )
                ),
                onTap: () {
                  classCreateIdx.state--;
                },
              )
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  height: ScreenUtil().setHeight(81),
                  width: double.infinity,
                  color: Color.fromRGBO(163, 163, 163, 1),

                  child: Column(
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(16)),
                      Center(
                        child: Text(
                          '다음',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),
                        ),
                      )
                    ],
                  )
                ),
                onTap: () {
                  classCreateIdx.state++;
                },
              )
            ),
          ],
        )
      ),
    );
  }
}