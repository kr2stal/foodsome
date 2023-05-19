import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_radio_widget.dart';
import '../../../widgets/home/create_page_app_bar_widget.dart';
import '../class_create_screen.dart';


enum SingingCharacter { group, personal }

class ClassCreateScreen2 extends ConsumerStatefulWidget {
  int idx;
  ClassCreateScreen2(this.idx, {Key? key}) : super(key: key);

  @override
  ClassCreateScreen2State createState() => ClassCreateScreen2State();
}

class ClassCreateScreen2State extends ConsumerState<ClassCreateScreen2> {
  late int idx;
  List<Class> classes = <Class>[];
  final GlobalKey _mainSectionKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  SingingCharacter? _character = SingingCharacter.group;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idx = widget.idx;
    classes.add(new Class("그룹 클래스", false));
    classes.add(new Class('퍼스널 클래스', false));
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
                            SizedBox(height: ScreenUtil().setHeight(132)),
                            Text('그룹 or 개인', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(25)),),
                            SizedBox(height: ScreenUtil().setHeight(101)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: ScreenUtil().setHeight(240),
                                  child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: classes.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          classes.forEach((gender) => gender.isSelected = false);
                                          classes[index].isSelected = true;
                                        });
                                        Future.delayed(const Duration(milliseconds: 500), () {
                                          if(index == 0){
                                            classCreateIdx.state++;
                                          }	
                                          else{
                                            for(int i = 0; i < 2; i++)
                                            classCreateIdx.state++;
                                          }
                                        });
                                        
                                      },
                                      child: CustomRadioWidget(classes[index], index),
                                    );
                                  })
                                ),
                              ],
                            )
                          ],
                        ),
                      )
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