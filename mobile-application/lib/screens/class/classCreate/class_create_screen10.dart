import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/home/create_page_app_bar_widget.dart';
import '../class_create_screen.dart';

enum SingingCharacter { group, personal }

class ClassCreateScreen10 extends ConsumerStatefulWidget {
  int idx;
  ClassCreateScreen10(this.idx, {Key? key}) : super(key: key);
  

  @override
  ClassCreateScreen10State createState() => ClassCreateScreen10State();
}

class ClassCreateScreen10State extends ConsumerState<ClassCreateScreen10> {
  late int idx;
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  SingingCharacter? _character = SingingCharacter.group;
  String? choiceValue;
  String? choiceValue2;

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
                            Text('어디에 사는', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            Text('수강생을 모집할까요?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            SizedBox(height: ScreenUtil().setHeight(60)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), ScreenUtil().setWidth(2)),
                              child: Container(
                                height: ScreenUtil().setHeight(65),
                                width: ScreenUtil().setWidth(350),
                                child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                      color: Color.fromRGBO(163, 163, 163, 1)
                                    )
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), ScreenUtil().setWidth(4), ScreenUtil().setWidth(16), ScreenUtil().setWidth(4)),
                                    child: DropdownButton<String>(
                                      value: choiceValue,
                                      icon: Icon(Icons.keyboard_arrow_down_sharp),
                                      isExpanded: true,
                                      underline: SizedBox(),
                                      style: TextStyle(color: Colors.white),
                                      iconEnabledColor:Color.fromRGBO(163, 163, 163, 1),
                                      items: <String>[
                                        '서울특별시',
                                        '부산광역시',
                                        '대구광역시',
                                        '인천광역시',
                                        '광주광역시',
                                        '대전광역시',
                                        '울산광역시',
                                        '경기도',
                                        '강원도',
                                        '충청북도',
                                        '충청남도',
                                        '전라북도',
                                        '전라남도',
                                        '경상북도',
                                        '경상남도',
                                        '제주특별자치도',
                                        '세종특별자치시',
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,style:TextStyle(color:Color.fromRGBO(163, 163, 163, 1), fontSize: ScreenUtil().setSp(13)),),
                                        );
                                      }).toList(),
                                      hint:Text(
                                        "시/도",
                                        style: TextStyle(
                                          color: Color.fromRGBO(163, 163, 163, 1),
                                          fontSize: ScreenUtil().setSp(13)
                                        ),
                                      ),
                                      onChanged: (String? value) {
                                        setState(() {
                                          choiceValue = value;
                                        });
                                      },
                                    ),
                                  )
                                )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), ScreenUtil().setWidth(2)),
                              child: Container(
                                height: ScreenUtil().setHeight(65),
                                width: ScreenUtil().setWidth(350),
                                child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                      color: Color.fromRGBO(163, 163, 163, 1)
                                    )
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), ScreenUtil().setWidth(4), ScreenUtil().setWidth(16), ScreenUtil().setWidth(4)),
                                    child: DropdownButton<String>(
                                      value: choiceValue2,
                                      icon: Icon(Icons.keyboard_arrow_down_sharp),
                                      isExpanded: true,
                                      underline: SizedBox(),
                                      style: TextStyle(color: Colors.white),
                                      iconEnabledColor:Color.fromRGBO(163, 163, 163, 1),
                                      items: <String>[
                                        '종로구',
                                        '중구',
                                        '용산구',
                                        '성동구',
                                        '광진구',
                                        '동대문구',
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,style:TextStyle(color:Color.fromRGBO(163, 163, 163, 1), fontSize: ScreenUtil().setSp(13)),),
                                        );
                                      }).toList(),
                                      hint:Text(
                                        "구/군",
                                        style: TextStyle(
                                          color: Color.fromRGBO(163, 163, 163, 1),
                                          fontSize: ScreenUtil().setSp(13)
                                        ),
                                      ),
                                      onChanged: (String? value) {
                                        setState(() {
                                          choiceValue2 = value;
                                        });
                                      },
                                    ),
                                  )
                                )
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
              child: Container(
                height: ScreenUtil().setHeight(81),
                width: double.infinity,
                color: Color.fromRGBO(124, 124, 124, 1),
                child: TextButton(
                  onPressed: () {
                  classCreateIdx.state--;
                },
                child: Text(
                  '이전',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(18)),
                ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: ScreenUtil().setHeight(81),
                width: double.infinity,
                color: Color.fromRGBO(163, 163, 163, 1),
                child: TextButton(
                  onPressed: () {
                  classCreateIdx.state++;
                },
                child: Text(
                  '다음',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(18)),
                ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}