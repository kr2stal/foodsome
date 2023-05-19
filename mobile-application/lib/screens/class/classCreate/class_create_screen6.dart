import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/home/create_page_app_bar_widget.dart';
import '../class_create_screen.dart';

enum SingingCharacter { group, personal }

class ClassCreateScreen6 extends ConsumerStatefulWidget {
  int idx;
  ClassCreateScreen6(this.idx, {Key? key}) : super(key: key);
  

  @override
  ClassCreateScreen6State createState() => ClassCreateScreen6State();
}

class ClassCreateScreen6State extends ConsumerState<ClassCreateScreen6> {
  late int idx;
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  SingingCharacter? _character = SingingCharacter.group;

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
        child: GestureDetector(
        onTap: () {
        FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(81)),
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
                            SizedBox(height: ScreenUtil().setHeight(120)),
                            Text('클래스 제목과', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            Text('정보를 입력해주세요.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            SizedBox(height: ScreenUtil().setHeight(60)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), ScreenUtil().setWidth(2)),
                              child: Container(
                                height: ScreenUtil().setHeight(65),
                                width: ScreenUtil().setWidth(350),
                                child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color: Color.fromRGBO(163, 163, 163, 1)
                                  )
                                ),
                                child: TextField(
                                cursorColor: Colors.grey,
                                textAlign: TextAlign.start,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                                  hintText: '클래스 제목',
                                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1), fontSize: ScreenUtil().setSp(13)),
                                  isDense: true,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                              )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), ScreenUtil().setWidth(2)),
                              child: Container(
                                height: ScreenUtil().setHeight(200),
                                width: ScreenUtil().setWidth(350),
                                child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color: Color.fromRGBO(163, 163, 163, 1)
                                  )
                                ),
                                child: TextField(
                                cursorColor: Colors.grey,
                                textAlign: TextAlign.start,
                                textInputAction: TextInputAction.newline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                                  hintText: '클래스 정보',
                                  hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1), fontSize: ScreenUtil().setSp(13)),
                                  isDense: true,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                              )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), ScreenUtil().setWidth(2)),
                              child: Container(
                                height: ScreenUtil().setHeight(20),
                                width: ScreenUtil().setWidth(350),
                                padding: EdgeInsets.only(left:ScreenUtil().setWidth(8)),
                                child: Text(
                                  '*모든 정보는 수정가능합니다',
                                  style: TextStyle(fontSize: ScreenUtil().setSp(11), color: Color.fromRGBO(163, 163, 163, 1)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]
        ),
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