import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gymsome/screens/class/classCreate/class_create_screen4.dart';

import '../../../widgets/home/create_page_app_bar_widget.dart';
import '../class_create_screen.dart';


enum SingingCharacter { group, personal }

class ClassCreateScreen5 extends ConsumerStatefulWidget {
  int idx;
  ClassCreateScreen5(this.idx, {Key? key}) : super(key: key);
  

  @override
  ClassCreateScreen5State createState() => ClassCreateScreen5State();
}

class ClassCreateScreen5State extends ConsumerState<ClassCreateScreen5> {
  late int idx;
  List<Class> classes = <Class>[];
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  SingingCharacter? _character = SingingCharacter.group;

  @override
  void initState() {
    idx = widget.idx;
    classes.add(new Class("3만원", false));
    classes.add(new Class('5만원', false));
    classes.add(new Class("10만원", false));
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
                            Text('클래스 가격을', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            Text('알려주세요.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            SizedBox(height: ScreenUtil().setHeight(60)),
                            for(int i = 0; i < 3; i++)
                                Padding(
                                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), 0),
                                  child: Container(
                                    width: ScreenUtil().setWidth(350),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          classes.forEach((gender) => gender.isSelected = false);
                                          classes[i].isSelected = true;
                                        });
                                        Future.delayed(const Duration(milliseconds: 500), () {
                                          classCreateIdx.state++;	
                                        });
                                      },
                                      child: CustomRadioWidget2(classes[i]), 
                                    )
                                  ),
                                ),
                                Padding(
                              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0, ScreenUtil().setWidth(16), ScreenUtil().setWidth(2)),
                              child: Container(
                                width: ScreenUtil().setWidth(350),
                                padding: EdgeInsets.only(left:ScreenUtil().setWidth(8)),
                                child: Text(
                                  '*1회 기준 가격입니다',
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