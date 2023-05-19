import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/home/create_page_app_bar_widget.dart';
import '../class_create_screen.dart';

enum SingingCharacter { group, personal }

class ClassCreateScreen8 extends ConsumerStatefulWidget {
  int idx;
  ClassCreateScreen8(this.idx, {Key? key}) : super(key: key);
  

  @override
  ClassCreateScreen8State createState() => ClassCreateScreen8State();
}

class ClassCreateScreen8State extends ConsumerState<ClassCreateScreen8> {
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
                            Text('클래스는', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            Text('어디서 하나요?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            SizedBox(height: ScreenUtil().setHeight(80)),
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
                                      hintText: '장소 입력',
                                      hintStyle: TextStyle(color: Color.fromRGBO(163, 163, 163, 1), fontSize: ScreenUtil().setSp(13)),
                                      isDense: true,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    onTap: () {
                                      _scrollController.animateTo(200.0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                    },
                                  ),
                                )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), 0),
                              child: Container(
                                height: ScreenUtil().setHeight(65),
                                width: ScreenUtil().setWidth(350),
                                child: Card(
                                  color: Color.fromRGBO(239, 239, 239, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: TextField(
                                    cursorColor: Colors.grey,
                                    textAlign: TextAlign.start,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                                      prefixIcon: Icon(Icons.search_sharp, size: ScreenUtil().setHeight(26), color: Color.fromRGBO(163, 163, 163, 1)),
                                      hintText: '지번, 도로명, 건물명으로 검색',
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
                            Container(
                                height: ScreenUtil().setHeight(65),
                                width: ScreenUtil().setWidth(360),
                                child: ListTile(
                                  title: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.location_searching_sharp, size: ScreenUtil().setSp(16), color: Color.fromRGBO(51, 51, 51, 1),),
                                        SizedBox(width: ScreenUtil().setWidth(10),),
                                        Text('현재 위치로 설정하기', style: TextStyle(color: Color.fromRGBO(51, 51, 51, 1), fontSize: ScreenUtil().setSp(12)),),
                                      ],
                                    ),
                                  ),
                                  trailing: Icon(Icons.keyboard_arrow_right_sharp),
                                )
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